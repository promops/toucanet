import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet/app/pages/messages/dialog_page/wrapper.dart';
import 'package:toucanet/app/styles/fonts.dart';

import '../../../../data/remotes/vk_messages_remote.dart';
import '../../../../data/repositories/accounts_repository.dart';
import '../../../blocs/conversation_bloc/conversation_bloc.dart';
import '../../../styles/app_colors.dart';
import '../../../view_models/dialog_view_model.dart';
import '../../../widgets/loading_indicator.dart';
import 'message_field.dart';

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
        .send(widget.dialogModel.id, text, widget.dialogModel.type);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            appBar: PreferredSize(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(),
                    Column(
                      children: <Widget>[
                        Text(
                          widget.dialogModel.title,
                          style: Fonts.h1.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                    Container()
                  ],
                ),
                preferredSize: Size.fromHeight(60)),
            backgroundColor: AppColors.mainBlue,
            body: Column(
              children: <Widget>[
                Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44)),
                        child: Container(
                            color: Colors.white,
                            child: BlocBuilder(
                                bloc: _conversationBloc,
                                builder: (BuildContext context,
                                    ConversationState state) {
                                  if (state is MessagesList) {
                                    return ListView.builder(
                                        reverse: true,
                                        controller: _controller,
                                        itemCount: state.messages.length + 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          if (index != state.messages.length) {
                                            return Wrapper(
                                              message: state.messages[index],
                                              withPhoto: true,
                                              photoUrl:
                                                  widget.dialogModel.avatarUrl,
                                            );
                                          }
                                          return index % 12 != 0
                                              ? Offstage()
                                              : LoadingIndicator();
                                        });
                                  }

                                  return Container();
                                })))),
                MessageField(sendCallback: _sendButtonHandler)
              ],
            )));
  }
}
