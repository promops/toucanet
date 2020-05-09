part of 'isolate_supervisor.dart';

abstract class IsolateResult<R>
{
  final Capability capability;

  IsolateResult(this.capability);

  factory IsolateResult.value(IsolateTask task, R value) => 
    IsolateValueResult<R>(task, value);

  factory IsolateResult.error(IsolateTask task, Object error) =>
      IsolateErrorResult<R>(task, error);

  factory IsolateResult.exit(IsolateTask task, [R value]) =>
    IsolateExitResult<R>(task, value);
}

class IsolateValueResult<R> extends IsolateResult<R> 
{
  final R value;
  IsolateValueResult(IsolateTask task, this.value) : super(task.capability);
}

class IsolateErrorResult<R> extends IsolateResult<R> 
{
  final Object error;
  IsolateErrorResult(IsolateTask task, this.error) : super(task.capability);
}

class IsolateExitResult<R> extends IsolateValueResult<R> 
{
  IsolateExitResult(IsolateTask task, [value]) : super(task, value);
}
