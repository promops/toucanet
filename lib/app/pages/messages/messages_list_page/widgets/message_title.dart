import 'package:flutter/material.dart';

class MessageTitle extends StatelessWidget {
  final String text;

  const MessageTitle({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
    );
  }
}
