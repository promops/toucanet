import '../../data/objects/message/attachments/attachment.dart';

class MessageViewModel {
  MessageViewModel(
      {this.senderAvatarUrl,
      this.id,
      this.text,
      this.senderFirstName,
      this.senderLastName,
      this.date,
      this.attachments,
      this.out});

  final String text;
  final String senderFirstName;
  final String senderLastName;
  final int date;
  final String senderAvatarUrl;
  final bool out;
  final int id;

  final List<Attachment> attachments;

  @override
  String toString() => '$text';
}
