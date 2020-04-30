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
  final _scrollThreshold = 400.0;

  ScrollController _controller;

  void _onScroll() {
    final maxScroll = _controller.position.maxScrollExtent;
    final minScroll = _controller.position.minScrollExtent;
    final currentScroll = _controller.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _conversationBloc.add(FetchMessages(widget.dialogModel.id));
    }
  }

  @override
  void initState() {
    _conversationBloc = ConversationBloc();

    _controller = ScrollController();
    _controller.addListener(_onScroll);
    _conversationBloc.add(FetchMessages(widget.dialogModel.id));

    super.initState();
  }

  void _sendButtonHandler(String text) async {
    await VKMessagesRemote(AccountsRepository().current.token)
        .send(widget.dialogModel.id, text);
    //_conversationBloc.add(FetchMessages(widget.dialogModel.id));
    setState(() {
      
    });
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Column(
          children: <Widget>[
            Expanded(
                child: BlocBuilder(
                    bloc: _conversationBloc,
                    builder: (BuildContext context, ConversationState state) {
                      if (state is MessagesList) {
                        return ListView.builder(
                            reverse: true,
                            controller: _controller,
                            itemCount: state.messages.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              if (index != state.messages.length) {
                                return TextMessageWidget(state.messages[index]);
                              }
                              return index % 12 != 0
                                  ? Offstage()
                                  : LoadingIndicator();
                            });
                      }

                      return Container();
                    })),
            MessageField(sendCallback: _sendButtonHandler)
          ],
        ));
  }
}
