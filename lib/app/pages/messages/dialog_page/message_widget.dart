import 'package:toucanet/data/models/message/message.dart';

abstract class MessageWidget {
  final Message message;

  MessageWidget(this.message);
}
