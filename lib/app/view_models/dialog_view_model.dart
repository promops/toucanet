import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class DialogViewModel extends Equatable {
  DialogViewModel({
    this.avatarUrl,
    this.title,
    this.lastMessage,
    this.type,
    @required this.peerId,
    @required this.online,
    @required this.out,
  });
  final String avatarUrl;

  final String title;

  final String lastMessage;

  final int peerId;

  final String type;

  bool online;

  bool out;

  @override
  String toString() => '$title $lastMessage';

  @override
  List<Object> get props => [peerId];
}
