import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet/app/blocs/conversation_bloc/conversation_bloc.dart';
import 'package:toucanet/app/pages/messages/dialog_page/message_field.dart';
import 'package:toucanet/app/styles/app_colors.dart';
import 'package:toucanet/app/styles/indents.dart';
import 'package:toucanet/app/view_models/dialog_view_model.dart';
import 'package:toucanet/app/widgets/loading_indicator.dart';
import 'package:toucanet/data/objects/message/conversation.dart';

import 'package:toucanet/data/remotes/vk_messages_remote.dart';
import 'package:toucanet/data/repositories/accounts_repository.dart';

import 'text_message_widget.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key key, this.dialogModel}) : super(key: key);
  final DialogViewModel dialogModel;

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  ConversationBloc _conversationBloc;
  TextEditingController _textController;

  @override
  void initState() {
    _conversationBloc = ConversationBloc();
    _textController = TextEditingController();
    _conversationBloc.add(FetchMessages(widget.dialogModel.id));

    super.initState();
  }

  void _sendButtonHandler(String text) async {
    await VKMessagesRemote(AccountsRepository().current.token)
        .send(widget.dialogModel.id, text);
    _conversationBloc.add(FetchMessages(widget.dialogModel.id));

  print(text);
    _textController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Column(
          children: <Widget>[
            Expanded(child:BlocBuilder(
                bloc: _conversationBloc,
                builder: (BuildContext context, ConversationState state) {
                  if (state is MessagesList) {
                    return ListView(
                      children: <Widget>[
                        for (var message in state.messages)
                          TextMessageWidget(message)
                      ],
                    );
                  }

                  return LoadingIndicator();
                })),

                MessageField(
                  sendCallback: _sendButtonHandler
                )
          ],
        ));
  }
}
