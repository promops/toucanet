part of 'isolate_supervisor.dart';

enum IsolateStatus { none, idle, arrives, paused }

class IsolateWrapper
{
  final String name;

  SendPort _sendPort;
  ReceivePort _receivePort;

  Isolate _isolate;
  Stream _broadcast;
  IsolateStatus status;
  
  Completer<bool> _initCompleter;

  IsolateWrapper([this.name])
  { 
    this.status = IsolateStatus.none;
    this._spawn();
  }

  Future<bool> initialize() => this._initCompleter.future;

  Stream<IsolateResult> execute(IsolateTask task) async*
  {
    if (this._broadcast == null) throw IsolateUndefinedException();
    
    this._sendPort.send(task);

    await for(final result in this._broadcast.cast<IsolateResult>()) 
    {
      yield result;

      if (result is IsolateExitResult) {
        this.status = IsolateStatus.idle;
        return;
      }
    }
  }

  Future<void> _spawn() async
  {
    this._receivePort = ReceivePort();
    this._initCompleter = Completer<bool>();

    try {
      this._isolate = await Isolate.spawn(
        IsolateWrapper._entryPoint, 
        this._receivePort.sendPort, 
        paused: false,
        errorsAreFatal: false,
      );
    } 
    on dynamic catch (_) {
      this._initCompleter.complete(false);
      return;
    }

    this._broadcast = this._receivePort.asBroadcastStream();

    this._sendPort = await this._broadcast.first;
    this._sendPort.send(this.name);

    this.status = IsolateStatus.idle;
    this._initCompleter.complete(true);
  }

  Future<void> cancel() async 
  {
    await this.dispose();
    await this._spawn();
  }

  Future<void> dispose() async 
  {
    this._isolate?.kill();
    this._receivePort?.close();

    this._broadcast = null;
    this.status = IsolateStatus.none;
  }

  static void _entryPoint(SendPort outPort) async 
  {
    final inPort = ReceivePort();
    outPort.send(inPort.sendPort);
    
    final broadcast = inPort.asBroadcastStream();
    final debugName = await broadcast.first;

    await for (IsolateTask task in broadcast) {
      final context = IsolateContext(task, outPort, debugName);

      try {
        final result = task.function(context);
        
        if (result is! Stream) {
          context.sink.exit(await result);
        }

        await for (final value in result) {
          context.sink.add(value);
        }

        context.sink.exit();
      } 
      on IsolateForceExitException catch(_) { }
      on dynamic catch (error) {
        try {
          context.sink.addError(error);
        } catch (error) {
          context.sink.addError(
            IsolateTooBigStacktraceException(debugName, error.toString()));
        }
      }
    }

    inPort.close();
  }
}
