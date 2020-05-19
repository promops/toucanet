import 'package:flutter/material.dart';

import '../../../../../app/models/dialog_view_model.dart';
import '../../../../styles/app_colors.dart';
import '../../../../styles/indents.dart';
import '../../dialog_page/dialog_page.dart';
import 'dialog_text.dart';
import 'dialog_title.dart';
import 'user_avatar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet/app/blocs/conversation_bloc/conversation_bloc.dart';

class DialogWidget extends StatefulWidget {
  final DialogViewModel dialogModel;

  const DialogWidget({Key key, this.dialogModel}) : super(key: key);
  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => DialogPage(
                      dialogModel: widget.dialogModel,
                      bloc: BlocProvider.of<ConversationBloc>(context),
                    ))),
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: Indents.medium,
              top: Indents.medium,
              right: Indents.large,
              left: Indents.medium),
          child: Container(
            height: 80,
            color: AppColors.mainColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UserAvatar(
                    url: widget.dialogModel.avatarUrl,
                    online: widget.dialogModel.online),
                Expanded(
                    child: Container(
                        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DialogTitle(text: widget.dialogModel.title),
                    DialogText(
                        text: widget.dialogModel.out
                            ? 'Вы: ' + widget.dialogModel.lastMessage
                            : widget.dialogModel.lastMessage),
                    Expanded(
                      child: Container(),
                    )
                  ],
                ))),
              ],
            ),
          ),
        ));
  }
}
