part of 'isolate_supervisor.dart';

class IsolateContext<R, A>
{
  final String debugName;
  final IsolateTask<R, A> _task;
  final IsolateContextSink sink;

  A get args => this._task.arguments;

  IsolateContext(this._task, SendPort outPort, this.debugName) :
    this.sink = IsolateContextSink<R>(outPort, _task);
}

class IsolateContextSink<R>
{
  final SendPort outPort;
  final IsolateTask task;
  
  IsolateContextSink(this.outPort, this.task);

  void add(R value) => outPort.send(IsolateResult.value(task, value));
  void addError(Object error) => outPort.send(IsolateResult.error(task, error));

  void exit([R value])
  {
    outPort.send(IsolateResult.exit(task, value));
    throw IsolateForceExitException();
  }
}