///Модель для отправителя/получателя сообщения
class Peer {
  Peer({this.id, this.type, this.localId});

  final int id;

  final String type;

  final int localId;

  factory Peer.fromJson(Map<String, dynamic> json) {
    return Peer(
      id: json['id'],
      type: json['type'],
      localId: json['local_id'],
    );
  }

  @override
  String toString() => '$id $type $localId';
}
