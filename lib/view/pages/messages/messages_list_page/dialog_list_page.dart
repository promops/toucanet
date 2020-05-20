import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet/data/services/messages_service.dart';

import '../../../../app/blocs/conversation_list_bloc/conversation_list_bloc.dart';
import '../../../styles/app_colors.dart';
import '../../../styles/indents.dart';
import '../../../widgets/loading_indicator.dart';
import 'widgets/dialog_widget.dart';

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
    if (maxScroll - currentScroll <= _scrollThreshold) {
      print('++');
      _dialogBloc.add(FetchDialogs());
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _dialogBloc = ConversationListBloc(RepositoryProvider.of<MessagesService>(context));
    _controller.addListener(_onScroll);
    _dialogBloc.add(FetchDialogs());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Починить контроллер для скролла
    return SizedBox.expand(
        child: DraggableScrollableSheet(
            initialChildSize: 0.8,
            minChildSize: 0.8,
            builder: (BuildContext context, _controller) {
              return ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(44),
                      topRight: Radius.circular(44)),
                  child: Container(
                      padding: const EdgeInsets.only(top: Indents.medium),
                      color: AppColors.mainColor,
                      child: BlocBuilder(
                          bloc: _dialogBloc,
                          builder: (BuildContext context,
                              ConversationListState state) {
                            if (state is ConversationList) {
                              return ListView.builder(
                                  controller: _controller,
                                  itemCount: state.dialogs.length + 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (index != state.dialogs.length) {
                                      return DialogWidget(
                                          dialogModel: state.dialogs[index]);
                                    }
                                    return index % 10 != 0
                                        ? Offstage()
                                        : LoadingIndicator();
                                  });
                            }

                            return Container();
                          })));
            }));
  }
}
