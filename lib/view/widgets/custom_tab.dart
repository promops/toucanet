import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final double height;
  final Widget child;
  final Function onTap;

  const CustomTab({@required this.child, Key key, this.height, this.onTap})
      : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () => this.onTap(), child: child);
  }
}
