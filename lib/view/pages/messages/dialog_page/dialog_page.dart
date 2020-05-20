import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet/view/pages/messages/dialog_page/wrapper.dart';
import 'package:toucanet/view/styles/fonts.dart';

import '../../../../app/blocs/conversation_bloc/conversation_bloc.dart';
import '../../../../app/models/dialog_view_model.dart';
import '../../../../data/remotes/vk_messages_remote.dart';
import '../../../../data/repositories/accounts_repository.dart';
import '../../../styles/app_colors.dart';
import '../../../widgets/loading_indicator.dart';
import 'message_field.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key key, this.dialogModel, this.bloc}) : super(key: key);
  final DialogViewModel dialogModel;
  final ConversationBloc bloc;

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  // ConversationBloc _conversationBloc;
  final _scrollThreshold = 400.0;

  ScrollController _controller;

  void _onScroll() {
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      widget.bloc.add(FetchMessages(widget.dialogModel.peerId));
    }
  }

  @override
  void initState() {
    // _conversationBloc = ConversationBloc();

    _controller = ScrollController();
    _controller.addListener(_onScroll);

    widget.bloc.add(FetchMessages(widget.dialogModel.peerId));

    super.initState();
  }

  void _sendButtonHandler(String text) async {
    // await VKMessagesRemote(AccountsRepository().current.token)
    
    await RepositoryProvider.of<VKMessagesRemote>(context)
        .send(widget.dialogModel.peerId, text, widget.dialogModel.type);

    setState(() {});
  }

  @override
  void dispose() {
    //_conversationBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          widget.bloc.add(Reset());
          return true;
        },
        child: SafeArea(
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
                                    bloc: widget.bloc,
                                    builder: (BuildContext context,
                                        ConversationState state) {
                                      // print('state:');
                                      // print(state);
                                      if (state is MessagesList) {
                                        //print(state.messages);
                                        return ListView.builder(
                                            reverse: true,
                                            controller: _controller,
                                            itemCount:
                                                state.messages.length + 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              if (index !=
                                                  state.messages.length) {
                                                return Wrapper(
                                                  message:
                                                      state.messages[index],
                                                  withPhoto: true,
                                                  photoUrl: widget
                                                      .dialogModel.avatarUrl,
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
                ))));
  }
}
