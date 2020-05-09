part of 'isolate_supervisor.dart';

abstract class IsolateException implements Exception {}

/// Thrown when unknown exception occurred.
class IsolateUndefinedException implements IsolateException {}

/// Thrown when there aren't any isolate available to take the job.
class IsolateNoAvailableException implements IsolateException {}

/// Thrown when the task was forcibly canceled.
class IsolateForceExitException implements IsolateException {}

/// Thrown when stackTrace is too big to return from isolate.
class IsolateTooBigStacktraceException implements IsolateException 
{
  final String message;
  final String debugName;
  IsolateTooBigStacktraceException(this.debugName, this.message);

  @override
  String toString() => '$debugName: $message';
}
