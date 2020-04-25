import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet/app/blocs/conversation_bloc/conversation_bloc.dart';
import 'package:toucanet/app/styles/app_colors.dart';
import 'package:toucanet/app/widgets/loading_indicator.dart';
import 'package:toucanet/data/models/message/conversation.dart';

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

  @override
  void initState() {
    _conversationBloc = ConversationBloc();
    _conversationBloc.add(FetchMessages(widget.conversation.peer.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: BlocBuilder(
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
            })

        // ListView(
        //   children: [
        //     TextMessageWidget(message),
        //     TextMessageWidget(message2)
        //   ],
        // ),
        );
  }
}
