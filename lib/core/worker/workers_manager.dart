import 'dart:isolate';

import 'package:toucanet/core/worker/worker.dart';

class WorkersManager {

  static final WorkersManager _singleton = WorkersManager._internal();

  factory WorkersManager() => _singleton;
  
  WorkersManager._internal();

  List<Worker> workers = [];

  Future<void> init({int workersCount = 3}) async {
    for (int i = 0; i < workersCount; i++) {
      final worker = Worker();

      await worker.init();

      workers.add(worker);
    }
  }
}
