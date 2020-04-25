import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet/app/blocs/conversation_bloc/conversation_bloc.dart';
import 'package:toucanet/app/styles/app_colors.dart';
import 'package:toucanet/app/widgets/loading_indicator.dart';
import 'package:toucanet/data/models/message/conversation.dart';
import 'package:toucanet/data/remotes/vk_messages_remote.dart';
import 'package:toucanet/data/repositories/accounts_repository.dart';

import '../../../../data/models/message/message.dart';
import 'text_message_widget.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key key, this.conversation}) : super(key: key);
  final Conversation conversation;

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
    _conversationBloc.add(FetchMessages(widget.conversation.peer.id));

    super.initState();
  }

  void _sendButtonHandler() async {
    await VKMessagesRemote(AccountsRepository().current.token)
        .send(widget.conversation.peer.id, _textController.text);
    _conversationBloc.add(FetchMessages(widget.conversation.peer.id));

    _textController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Stack(
          children: <Widget>[
            BlocBuilder(
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
                }),
            Positioned(
                bottom: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width - 50,
                        child: TextField(
                          controller: _textController,
                        )),
                    IconButton(
                        icon: Icon(Icons.send), onPressed: ()=> _sendButtonHandler())
                  ],
                ))
          ],
        ));
  }
}
