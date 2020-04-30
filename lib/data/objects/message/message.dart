import 'package:toucanet/data/objects/message/attachments/attachment_type.dart';

import 'attachments/attachment.dart';
import 'attachments/models_by_type/sticker.dart';

class Message {
  Message(
      {this.id,
      this.date,
      this.fromId,
      this.readState,
      this.text,
      this.out,
      this.attachments});

  final int id;
  final int date;

  final int fromId;
  final int readState;
  final String text;

  final List<Attachment> attachments;

  int out;

  factory Message.fromJson(Map<String, dynamic> json) {
    List<Attachment> attachmentsList = [];
    //print(json['attachments']);
    for (var attach in json['attachments']) {
      switch (attach['type']) {
        case AttachmentType.sticker:
          attachmentsList.add(Sticker.fromJson(attach[AttachmentType.sticker]));
          break;
      }
    }
    
    return Message(
        id: json['id'],
        date: json['date'],
        fromId: json['from_id'],
        text: json['text'],
        out: json['out'],
        attachments: attachmentsList);
  }

  @override
  String toString() => '$id $text $attachments';
}
