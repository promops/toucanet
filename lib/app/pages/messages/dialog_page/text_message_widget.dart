import 'package:flutter/material.dart';

import '../../../../data/models/message/message.dart';
import 'message_widget.dart';

class TextMessageWidget extends StatefulWidget implements MessageWidget {
  TextMessageWidget(this.message);

  @override
  _TextMessageWidgetState createState() => _TextMessageWidgetState();

  @override
  final Message message;
}

class _TextMessageWidgetState extends State<TextMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.message.out == 0 
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Colors.red),
          child: Text(widget.message.text),
        )
      ],
    );
  }
}
