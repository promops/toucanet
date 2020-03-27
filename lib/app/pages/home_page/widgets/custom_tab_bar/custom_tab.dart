import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final double height;
  final Widget child;

  const CustomTab({@required this.child, Key key, this.height})
      : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: child);
  }
}
