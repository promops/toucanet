import 'package:flutter/foundation.dart';

class DialogViewModel {
  DialogViewModel({this.avatarUrl, this.title, this.lastMessage, @required this.id, @required this.online, @required this.out});
  final String avatarUrl;

  final String title;

  final String lastMessage;

  final int id;

  bool online;

  bool out;

  @override
  String toString() => '$title $lastMessage';
}
