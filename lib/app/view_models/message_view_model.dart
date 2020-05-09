import '../../data/objects/message/attachments/attachment.dart';

class MessageViewModel {
  MessageViewModel(
      {this.senderAvatarUrl,
      this.text,
      this.senderFirstName,
      this.senderLastName,
      this.date,
      this.attachments,
      this.out});

  final String text;
  final String senderFirstName;
  final String senderLastName;
  final String date;
  final String senderAvatarUrl;
  final bool out;

  final List<Attachment> attachments;
}
