part of 'isolate_manager.dart';

enum TaskStatus { awaiting, processing }
enum TaskPriority { low, regular, high }

typedef IsolateEntryPoint<R, A> = R Function(IsolateContext<A> context);

class IsolateTask<R, A>
{
  final A arguments;
  final Capability capability;
  final IsolateEntryPoint<R, A> function;

  TaskStatus status = TaskStatus.awaiting;
  TaskPriority priority = TaskPriority.regular;

  IsolateTask(this.function, this.arguments) : 
    assert(function != null),
    this.capability = Capability();

  R execute() => this.function(IsolateContext<A>(this.arguments));

  @override
  int get hashCode => capability.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || 
      other is IsolateTask && this.capability == other.capability;
}