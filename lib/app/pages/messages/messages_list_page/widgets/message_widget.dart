import 'package:flutter/material.dart';
import 'package:toucanet/app/pages/messages/messages_list_page/widgets/message_text.dart';
import 'package:toucanet/app/pages/messages/messages_list_page/widgets/message_title.dart';
import 'package:toucanet/app/pages/messages/messages_list_page/widgets/user_avatar.dart';
import 'package:toucanet/app/styles/colors.dart';
import 'package:toucanet/app/styles/indents.dart';
import 'package:toucanet/data/models/message.dart';

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
