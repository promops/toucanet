import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toucanet/app/styles/fonts.dart';
import 'package:toucanet/app/styles/indents.dart';
import 'package:toucanet/data/objects/message/message.dart';
import 'package:url_launcher/url_launcher.dart';

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
          margin: const EdgeInsets.only(top: Indents.small, bottom: Indents.small),
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: widget.message.out == 0
                  ? BorderRadius.horizontal(right: Radius.circular(15))
                  : BorderRadius.horizontal(left: Radius.circular(15)),
              color: Colors.red[100]),
          child: Uri.parse(widget.message.text).isAbsolute
              ? RichText(
                  text: TextSpan(
                      text: widget.message.text,
                      style: Fonts.h3.copyWith(color: Colors.blue, decoration: TextDecoration.underline,),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          final url = '${widget.message.text}';
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceSafariVC: false,
                            );
                          }
                        }))
              : Text(
                  widget.message.text,
                  style: Fonts.h3,
                  maxLines: 50,
                ),
        )
      ],
    );
  }
}
