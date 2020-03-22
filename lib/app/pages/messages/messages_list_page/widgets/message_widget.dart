import 'package:flutter/material.dart';

import '../../../../../data/models/message.dart';
import '../../../../styles/app_colors.dart';
import '../../../../styles/indents.dart';
import 'message_text.dart';
import 'message_title.dart';
import 'user_avatar.dart';

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
      padding: const EdgeInsets.only(bottom: Indents.medium),
      child: Container(
        color: AppColors.mainColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UserAvatar(),
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey[100], width: 5))),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MessageTitle(
                        text:
                            '${widget.message.senderFirstname} ${widget.message.senderLastName}'),
                    MessageText(text: widget.message.text),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
