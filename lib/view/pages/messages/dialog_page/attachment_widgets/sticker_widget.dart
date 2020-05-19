import 'package:flutter/material.dart';

class StickerWidget extends StatelessWidget {
  StickerWidget({this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(this.url),
    );
  }
}
