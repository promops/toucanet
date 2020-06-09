import '../enums/attachment_type.dart';
import 'attachments/attachment.dart';
import 'attachments/models_by_type/audio.dart';
import 'attachments/models_by_type/photo.dart';
import 'attachments/models_by_type/sticker.dart';

///Модель для сообщения
class Message {
  Message(
      {this.id,
      this.date,
      this.fromId,
      this.readState,
      this.text,
      this.out,
      this.attachments,
      this.peerId});

  final int id;
  final int date;

  final int fromId;
  final int readState;
  final int peerId;
  final String text;

  final List<Attachment> attachments;

  final int out;

  factory Message.fromJson(Map<String, dynamic> json) {
    List<Attachment> attachmentsList = [];

    for (var attach in json['attachments']) {
      switch (attach['type']) {
        case AttachmentType.sticker:
          attachmentsList.add(Sticker.fromJson(attach[AttachmentType.sticker]));
          break;

        case AttachmentType.audio:
          attachmentsList.add(Audio.fromJson(attach[AttachmentType.audio]));
          break;

        case AttachmentType.photo:
          attachmentsList.add(Photo.fromJson(attach[AttachmentType.photo]));
      }
    }
    return Message(
        id: json['id'],
        date: json['date'],
        fromId: json['from_id'],
        text: json['text'],
        out: json['out'],
        peerId: json['peer_id'],
        attachments: attachmentsList);
  }

  @override
  String toString() => '$id $text $attachments $fromId';
}
