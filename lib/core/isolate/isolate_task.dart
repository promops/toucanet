part of 'isolate_supervisor.dart';

enum TaskStatus { awaiting, processing, completed }
enum TaskPriority { low, regular, high }

typedef IsolateEntryPoint<R, A> = R Function(IsolateContext<R, A> context);

class IsolateTask<R, A>
{
  final A arguments;
  final Capability capability;
  final TaskPriority priority;
  final IsolateEntryPoint<R, A> function;

  TaskStatus status = TaskStatus.awaiting;

  IsolateTask(this.function, this.arguments, [TaskPriority priority]) : 
    assert(function != null),
    this.capability = Capability(),
    this.priority = priority ?? TaskPriority.regular;

  void close() => this.status = TaskStatus.completed;

  @override
  int get hashCode => capability.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || 
      other is IsolateTask && this.capability == other.capability;
}