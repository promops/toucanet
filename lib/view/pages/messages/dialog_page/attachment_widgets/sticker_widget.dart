import 'package:flutter/material.dart';

class StickerWidget extends StatelessWidget {
  StickerWidget({this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Image.network(this.url),
    );
  }
}
