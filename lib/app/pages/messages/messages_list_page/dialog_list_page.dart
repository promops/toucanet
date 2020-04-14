import 'package:flutter/material.dart';
import 'package:toucanet/data/models/message/message.dart';

import '../../../styles/app_colors.dart';
import '../../../styles/fonts.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/app_bar/widgets/backward_button.dart';
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
        Message(id : 1, text: 'Hi', direction: MessageDirection.IN);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: CustomAppBar(
          title: Text('Диалоги', style: Fonts.h1),
        ),
        body: ListView(
          children: <Widget>[
            DialogWidget(message: _message),
            DialogWidget(message: _message),
            DialogWidget(message: _message)
          ],
        ));
  }
}
