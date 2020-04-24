part of 'isolate_manager.dart';

enum IsolateStatus { none, idle, arrives, paused }

class IsolateWorker
{
  final String _name;
  final Completer _initCompleter;
  final ReceivePort _receivePort;

  Isolate _isolate;  
  SendPort _sendPort;
  IsolateStatus _isolateStatus;
  StreamSubscription _broadcastSubscription;
  
  String get name => this._name;
  IsolateStatus get status => this._isolateStatus;
  

  IsolateWorker([this._name]) : 
    this._receivePort = ReceivePort(),
    this._initCompleter = Completer()
  {
    this._isolateStatus = IsolateStatus.none;
    this._spawn(IsolateWorker._isolateEntryPoint);
  }


  Future<void> initialize() => this._initCompleter.future;


  Stream execute(IsolateTask task)
  {
    task.status = TaskStatus.processing;
    this._isolateStatus = IsolateStatus.arrives;

    this._sendPort.send(task);
    //TODO: IsolateWrapper.execute()
    return null;
  }


  Future<void> _spawn(Function entryPoint) async
  {
    final inPort = this._receivePort;
    final outPort = this._receivePort.sendPort;

    this._isolate = await Isolate
      .spawn(entryPoint, outPort, errorsAreFatal: false);

    Stream broadcast = inPort.asBroadcastStream();
    this._sendPort = await broadcast.first;
    
    this._isolateStatus = IsolateStatus.idle;
    this._broadcastSubscription = broadcast.listen((_)
    {
      //TODO: IsolateWrapper._spawn()
    });

    this._initCompleter.complete();
  }


  static void _isolateEntryPoint(SendPort sendPort) async 
  {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    
    await for (final IsolateTask task in receivePort) 
    {
      try {
        sendPort.send(1);
      } catch (error) {
        sendPort.send(2);
      }
    }
  }


  Future<void> dispose() async 
  {
    await this._broadcastSubscription.cancel();
    this._isolate.kill();
    this._receivePort.close();
  }
}
