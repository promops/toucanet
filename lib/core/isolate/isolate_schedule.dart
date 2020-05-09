part of 'isolate_supervisor.dart';

class IsolateSchedule
{
  final _entries = <Capability, IsolateScheduleEntry>{};  
  final _streamController = StreamController<IsolateResult>.broadcast();

  IsolateScheduleEntry<R, A> add<R, A>(
    IsolateEntryPoint<R, A> function, A arguments)
  {
    final task = IsolateTask<R, A>(function, arguments);
    final taskEntry = IsolateScheduleEntry(task, this._streamController.stream);
    
    return this._entries[task.capability] = taskEntry;
  }

  IsolateTask get availableTask => this._entries.values.firstWhere(
    (item) => item.task.status == TaskStatus.awaiting, 
    orElse: () => null
  )?.task;

  void update(IsolateResult result) => this._streamController.add(result);

  void reset() => this._entries.values
    .where((item) => item.task.status == TaskStatus.processing)
    .forEach((item) => item.task.status = TaskStatus.awaiting);

  IsolateScheduleEntry operator [](IsolateTask task) => 
    this._entries[task.capability];

  Future<void> close() async 
  {
    this._entries.clear();
    await this._streamController?.close();
  }
}

class IsolateScheduleEntry<R, A>
{
  final IsolateTask<R, A> task;
  final Stream<IsolateResult> stream;

  IsolateScheduleEntry(this.task, stream) :
    this.stream = stream.where((value) => value.capability == task.capability);

  void close() => this.task.close();
}