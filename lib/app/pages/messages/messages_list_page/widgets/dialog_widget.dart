import 'package:flutter/material.dart';

import '../../../../../data/models/message.dart';
import '../../../../styles/app_colors.dart';
import '../../../../styles/indents.dart';

import 'dialog_text.dart';
import 'dialog_title.dart';
import 'user_avatar.dart';

class DialogWidget extends StatefulWidget {
  final Message message;

  const DialogWidget({Key key, this.message}) : super(key: key);
  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.pushNamed(context, '/dialog'),
        child: Padding(
          padding: const EdgeInsets.only(bottom: Indents.medium),
          child: Container(
            height: 100,
            color: AppColors.mainColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UserAvatar(),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[700], width: .5))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            DialogTitle(
                                text:
                                    '${widget.message.senderFirstname} ${widget.message.senderLastName}'),
                            DialogText(text: widget.message.text),
                            Expanded(
                              child: Container(),
                            )
                          ],
                        ))),
              ],
            ),
          ),
        ));
  }
}
