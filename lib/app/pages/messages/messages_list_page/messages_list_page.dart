import 'package:flutter/material.dart';
import 'package:toucanet/app/pages/messages/messages_list_page/widgets/message_widget.dart';
import 'package:toucanet/data/models/message.dart';

class MessagesListPage extends StatefulWidget {
  @override
  _MessagesListPageState createState() => _MessagesListPageState();
}

class _MessagesListPageState extends State<MessagesListPage> {
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
        MessageWidget(message: _message),
        MessageWidget(message: _message),
        MessageWidget(message: _message)
      ],
    );
  }
}
