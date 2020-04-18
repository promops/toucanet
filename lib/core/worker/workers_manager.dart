import 'dart:isolate';

class WorkersManager {
  List<WorkerModel> workers = [];

  void init({int workersCount = 3}) {
    for (int i = 0; i < workersCount; i++) workers.add(WorkerModel());
  }

  // Future<dynamic> execute(Function function) async {
  //   ReceivePort receivePort = ReceivePort();
  //   isolate = await Isolate.spawn(function, receivePort.sendPort);

  //   receivePort.listen((data) {
  //     return data;
  //   });
  // }

}

class WorkerModel {
  WorkerModel();

  Isolate isolate;

  String status;

  static dynamic method(WorkerParameters parameters) {
    ReceivePort recievePort = ReceivePort();

    parameters.sendPort.send(recievePort.sendPort);

    parameters.method();
  }

  Future spawn(Function method) async {
    ReceivePort receivePort = ReceivePort();

    this.isolate = await Isolate.spawn(
        WorkerModel.method, WorkerParameters(receivePort.sendPort, method));

    Stream broadcastRecievePort = receivePort.asBroadcastStream();

    SendPort sendPort = await broadcastRecievePort.first;

    sendPort.send(method);

    
  }
}

class WorkerParameters {
  WorkerParameters(this.sendPort, this.method);

  final SendPort sendPort;
  final Function method;
}
