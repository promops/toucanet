import 'package:flutter/material.dart';
import 'package:toucanet/view/styles/fonts.dart';
import 'package:toucanet/view/styles/indents.dart';

class UserInformationWidget extends StatelessWidget {
  final String firstName;
  final String lastName;

  const UserInformationWidget({Key key, this.firstName, this.lastName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Indents.extraLarge),
        child: Row(
      children: <Widget>[
        Text(
          '$firstName',
          style: Fonts.h1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: Indents.small),
        ),
        Text(
          '$lastName',
          style: Fonts.h1,
        )
      ],
    ));
  }
}
