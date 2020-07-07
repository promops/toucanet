import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet/data/services/messages_service.dart';
import 'package:toucanet/view/widgets/dialog_widget.dart';

import '../../../../app/blocs/conversation_list_bloc/conversation_list_bloc.dart';
import '../../../styles/app_colors.dart';
import '../../../styles/indents.dart';
import '../../../widgets/loading_indicator.dart';

class DialogListPage extends StatefulWidget {
  @override
  _DialogListPageState createState() => _DialogListPageState();
}

class _DialogListPageState extends State<DialogListPage> {
  ConversationListBloc _dialogBloc;
  final _scrollThreshold = 400.0;
  ScrollController _controller;

  void _onScroll() {
    final maxScroll = _controller.position.maxScrollExtent;

    final currentScroll = _controller.position.pixels;
    // if (maxScroll - currentScroll <= _scrollThreshold) {
    //   _dialogBloc.add(FetchDialogs());
    // }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _dialogBloc =
        ConversationListBloc(RepositoryProvider.of<MessagesService>(context));
    _controller.addListener(_onScroll);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _dialogBloc.add(FetchDialogs());
    return Scaffold(
        backgroundColor: AppColors.background,
        body: BlocBuilder(
            bloc: _dialogBloc,
            condition: (ConversationListState prevState,
                ConversationListState currentState) {
              // print(prevState);
              // print('---');
              // print(currentState);
              return true;
            },
            builder: (BuildContext context, ConversationListState state) {
              //print(state);
              if (state is ConversationList) {
               // print(state.dialogs[0]);
                return ListView.builder(
                    controller: _controller,
                    itemCount: state.dialogs.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index != state.dialogs.length) {
                        return DialogWidget(dialogModel: state.dialogs[index]);
                      }
                      return index % 10 != 0 ? Offstage() : LoadingIndicator();
                    });
              }

              return Container();
            }));
  }
}
