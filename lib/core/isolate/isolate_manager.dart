import 'dart:async';
import 'dart:isolate';

part 'isolate_task.dart';
part 'isolate_worker.dart';
part 'isolate_context.dart';

class IsolateManager 
{
  final List<IsolateWorker> _workers;
  final Map<IsolateTask, Completer> _tasks;

  IsolateManager(int count, {String groupName = 'anonymous'}) : 
    assert(count >= 1),
    this._tasks = <IsolateTask, Completer>{},
    this._workers = List.generate(count, (i) => IsolateWorker('$groupName: worker_$i'));


  Future<R> compute<R, A>(IsolateEntryPoint<FutureOr<R>, A> workerFunction, A arguments) async
  {
    final task = IsolateTask<R, A>(workerFunction, arguments);
    this._tasks[task] = Completer<R>();
    
    this._schedule(task);
    return await this._tasks[task].future;
  }


  void _schedule([IsolateTask task]) async
  {
    final worker = await this._selectWorker();

    if (worker == null) return;

    task ??= this._tasks.keys.firstWhere(
      (task) => task.status == TaskStatus.awaiting, 
      orElse: () => null
    );

    if (task == null) return;

    //TODO: IsolateManager._schedule()
    // await for (final result in worker.execute(task));
  }

  Future<IsolateWorker> _selectWorker() async
  {
    for (final worker in this._workers) {
      await worker.initialize();

      if (worker.status == IsolateStatus.idle) {
        return worker;
      }
    }
    
    return null;
  }


  // Stream<S> launch<S, A>(IsolateEntryPoint<Stream<S>, A> proccessFunction, A args) async*
  // {
  // }


  Future<void> dispose() async 
  {
    for (final worker in this._workers) {
      await worker.dispose();
    }


    //TODO: IsolateManager.dispose()
  }
}
