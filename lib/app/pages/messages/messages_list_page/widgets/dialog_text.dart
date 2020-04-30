import 'package:flutter/material.dart';
import 'package:toucanet/app/styles/fonts.dart';
import 'package:toucanet/app/styles/indents.dart';

class DialogText extends StatelessWidget {
  final String text;

  const DialogText({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Indents.medium),
      child: Container(
        child: Text(text, style: Fonts.h2, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
