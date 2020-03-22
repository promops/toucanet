import 'package:flutter/material.dart';
import 'message_text.dart';
import 'message_title.dart';
import 'user_avatar.dart';
import '../../../../styles/colors.dart';
import '../../../../styles/indents.dart';
import '../../../../../data/models/message.dart';

class MessageWidget extends StatefulWidget {
  final Message message;

  const MessageWidget({Key key, this.message}) : super(key: key);
  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: medium),
      child: Container(
        color: mainColor,
        child: Row(
          children: <Widget>[
            UserAvatar(),
            Column(
              children: <Widget>[
                MessageTitle(
                    text:
                        '${widget.message.senderFirstname} ${widget.message.senderLastName}'),
                MessageText(text: widget.message.text)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
