import 'package:flutter/material.dart';
import 'package:toucanet/app/styles/app_colors.dart';

import '../../../../data/models/message/message.dart';
import 'text_message_widget.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  var message = Message(id: 1, text: 'Hi', direction: MessageDirection.IN);
  var message2 = Message(id: 1, text: 'Bye', direction: MessageDirection.OUT);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: 
      
      ListView(
        children: [
          TextMessageWidget(message),
          TextMessageWidget(message2)
        ],
      ),
    );
  }
}
