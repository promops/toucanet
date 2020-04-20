import 'dart:async';
import 'dart:isolate';

import 'package:toucanet/core/worker/task.dart';

import 'worker_parameters.dart';

class Worker {
  SendPort _sendPort;
  ReceivePort _receivePort = ReceivePort();
  Stream _broadcastReceivePort;



  Future<Worker> init() async {
    ReceivePort receivePort = ReceivePort();


    Isolate isolate = await Isolate.spawn(
        entryPoint, receivePort.sendPort);

    _broadcastReceivePort = _receivePort.asBroadcastStream();

    _sendPort = await _broadcastReceivePort.first;

    _broadcastReceivePort.listen((data) => print('data'));

    return Future.value();
  }

  Stream getBroadcast(){
    return _broadcastReceivePort;
  }


  void execute(Task task) {
    _sendPort.send(task);
  }
}

entryPoint(SendPort sendPort) {
  final receivePort = ReceivePort();

  sendPort.send(receivePort.sendPort);

}

