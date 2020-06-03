import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet/app/models/conversation_view_model.dart';
import 'package:toucanet/view/pages/messages/dialog_page/wrapper.dart';
import 'package:toucanet/view/styles/fonts.dart';
import 'package:toucanet/view/widgets/app_bar/backward_button.dart';
import 'package:toucanet/view/widgets/app_bar/custom_app_bar.dart';

import '../../../../app/blocs/conversation_bloc/conversation_bloc.dart';
import '../../../../data/remotes/vk_messages_remote.dart';
import '../../../styles/app_colors.dart';
import '../../../widgets/loading_indicator.dart';
import 'message_field.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key key, this.dialogModel, this.bloc}) : super(key: key);
  final ConversationViewModel dialogModel;
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
    return  Scaffold(
                appBar: CustomAppBar(
                  leading: BackwardButton(),
                  title: Text(widget.dialogModel.title),
                ),
                backgroundColor: AppColors.background,
                body: Column(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                            color: Colors.white,
                            child: BlocBuilder(
                                bloc: widget.bloc,
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
                                }))),
                    MessageField(sendCallback: _sendButtonHandler)
                  ],
                ));
  }
}
