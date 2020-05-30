import 'package:flutter/material.dart';
import 'package:toucanet/view/styles/fonts.dart';
import 'package:toucanet/view/styles/indents.dart';

class DialogTitle extends StatelessWidget {
  final String text;

  const DialogTitle({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: Indents.medium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child:Container(
              child: Text(text, style: Fonts.h1.copyWith(color: Colors.grey[700],), overflow: TextOverflow.ellipsis ),
            )),
            Text('17:40',  style: Fonts.h1.copyWith(color: Colors.grey[700], fontSize: 12))
          ],
        ));
  }
}
