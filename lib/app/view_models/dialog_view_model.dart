import 'package:flutter/foundation.dart';

class DialogViewModel {
  DialogViewModel({this.avatarUrl, this.title, this.lastMessage,this.type, @required this.id, @required this.online, @required this.out});
  final String avatarUrl;

  final String title;

  final String lastMessage;

  final int id;

  final String type;

  bool online;

  bool out;

  @override
  String toString() => '$title $lastMessage';
}
