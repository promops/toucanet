part of 'vk_api_client.dart';

class VKApiLongPoll
{
  Isolate _isolate;
  ReceivePort _receivePort;
  Stream _broadcastReceivePort;

  final VKApiClient client;

  static const retryAttempts = 3;
  static const connectTimeout = 25000;

  VKApiLongPoll(this.client) 
  { 
    this._runLongPollWorker(); 
  }

  Future<void> _runLongPollWorker() async
  {
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_longpollWorker, _receivePort.sendPort);

    (_broadcastReceivePort = _receivePort.asBroadcastStream())
      .listen((res) => print(res));
  }

  static Future<void> _longpollWorker(SendPort sendPort) async
  {
    int lastTimeStamp = 0;

    while (true) {
      try {
        // https://im.vk.com/nim186556087?act=a_check&key=84fc8667c14c469c89e453ed239&ts=1768878785&wait=25&mode=2&version=3

        lastTimeStamp = VKApiLongPollEventsResponse(1, {}).ts;
      }
      catch(_) {

      }
    }
  }

  Future<void> dispose() async 
  {
    _isolate.kill();
    _receivePort.close();
  }
}

