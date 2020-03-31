import 'package:flutter/material.dart';

import '../../../styles/fonts.dart';

class UserStatus extends StatelessWidget {
  final String status;

  const UserStatus({Key key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        status ?? '',
        style: Fonts.h1,
      ),
    );
  }
}
