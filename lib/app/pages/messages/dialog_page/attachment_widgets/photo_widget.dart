import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  final String url;

  const PhotoWidget({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('xx');
    return Container(
      child: Image.network(this.url),
    );
  }
}