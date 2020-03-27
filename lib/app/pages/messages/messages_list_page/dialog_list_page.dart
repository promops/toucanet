import 'package:flutter/material.dart';

import '../../../../data/models/message.dart';
import 'widgets/dialog_widget.dart';

class DialogListPage extends StatefulWidget {
  @override
  _DialogListPageState createState() => _DialogListPageState();
}

class _DialogListPageState extends State<DialogListPage> {
  Message _message;

  @override
  void initState() {
    _message =
        Message(text: 'Hi', senderFirstname: 'Егор', senderLastName: 'Попов');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DialogWidget(message: _message),
        DialogWidget(message: _message),
        DialogWidget(message: _message)
      ],
    );
  }
}
