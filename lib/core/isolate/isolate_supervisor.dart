import 'dart:io';
import 'dart:async';
import 'dart:isolate';

part 'isolate_task.dart';
part 'isolate_pool.dart';
part 'isolate_result.dart';
part 'isolate_wrapper.dart';
part 'isolate_context.dart';
part 'isolate_schedule.dart';
part 'isolate_exceptions.dart';

class IsolateSupervisor
{
  final _workers = IsolatePool();
  final _schedule = IsolateSchedule();

  IsolateSupervisor._();
  factory IsolateSupervisor() => _instance;
  static final IsolateSupervisor _instance = IsolateSupervisor._();

  Future<R> compute<R, A>(
    IsolateEntryPoint<FutureOr<R>, A> function, [A arguments]) async
  {
    if (this._workers.isEmpty) throw IsolateNoAvailableException();

    final task = this._schedule.add(function, arguments);
    this._arrangeWorkerOnSchedule();

    final result = await task.stream.first;

    task.close();
    this._arrangeWorkerOnSchedule();

    if (result is IsolateErrorResult) throw result.error;
    return (result as IsolateValueResult).value;
  }

  Stream launch<R, A>(
    IsolateEntryPoint<Stream<R>, A> function, 
    A arguments, 
    {bool errorsAreFatal = false}) async*
  {
    if (this._workers.isEmpty) throw IsolateNoAvailableException();

    final task = this._schedule.add(function, arguments);
    this._arrangeWorkerOnSchedule();

    await for (final result in task.stream) {
      if (result is IsolateErrorResult && errorsAreFatal) throw result.error;

      if (result is IsolateExitResult) {
        if (result.value != null) yield result.value;
        break;
      }

      if (result is IsolateValueResult) yield result.value;
      if (result is IsolateErrorResult) yield result.error;
    }
    
    task.close();
    this._arrangeWorkerOnSchedule();
  }

  void _arrangeWorkerOnSchedule() async
  {
    final worker = await this._workers.free;
    if (worker == null) return;
    
    final task = this._schedule.availableTask;
    if (task == null) return;

    task.status = TaskStatus.processing;
    worker.status = IsolateStatus.arrives;

    worker.execute(task).listen((value) => this._schedule.update(value));
  }

  Future<void> restart() async 
  {
    await this._workers.restart();

    this._schedule.reset();
    this._arrangeWorkerOnSchedule();
  }

  Future<void> dispose() async 
  {
    await this._workers.dispose();
    await this._schedule.close();
  }
}
