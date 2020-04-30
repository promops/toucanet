import 'package:flutter/material.dart';
import '../../../styles/indents.dart';

class MessageField extends StatefulWidget {
  MessageField({this.sendCallback});
  Function sendCallback;
  @override
  _MessageFieldState createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: Indents.large, right: Indents.large, bottom: Indents.medium),
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.blueAccent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child: TextField(
            controller: _controller,
          )),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () async => {
                    await widget.sendCallback(_controller.text),
                    _controller.text = ''
                  })
        ],
      ),
    );
  }
}
