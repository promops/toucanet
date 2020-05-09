part of 'isolate_supervisor.dart';

class IsolatePool
{
  final _isolates = <IsolateWrapper>[];

  bool get isEmpty => this._isolates.isEmpty;

  IsolatePool()
  {
    final numberOfProcessors = Platform.numberOfProcessors - 1;
    final numberOfIsolates = numberOfProcessors > 0 ? numberOfProcessors : 1;

    for (int i = 0; i < numberOfIsolates; ++i) {
      this._isolates.add(IsolateWrapper('Isolate: $i'));
    }
  }

  Future<IsolateWrapper> get free async
  {
    for (IsolateWrapper isolate in this._isolates) {
      if (!await isolate.initialize()) continue; 
      if (isolate.status == IsolateStatus.idle) return isolate;
    }
    return null;
  }

  Future<void> restart() async => 
    await Future.wait(this._isolates.map((isolate) => isolate.cancel())); 

  Future<void> dispose() async
  {
    await Future.wait(this._isolates.map((isolate) => isolate.dispose()));
    this._isolates.clear();
  }
}