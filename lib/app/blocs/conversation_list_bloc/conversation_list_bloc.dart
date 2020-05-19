import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/services/messages_service.dart';
import '../../models/dialog_view_model.dart';

part 'conversation_list_event.dart';
part 'conversation_list_state.dart';

class ConversationListBloc
    extends Bloc<ConversationsListEvent, ConversationListState> {
  @override
  ConversationListState get initialState => Loading();

  int offset = 0;

  @override
  Stream<Transition<ConversationsListEvent, ConversationListState>>
      transformEvents(
          Stream<ConversationsListEvent> events,
          TransitionFunction<ConversationsListEvent, ConversationListState>
              transitionFn) {
    final nonDebounceStream = events.where((event) => event is! FetchDialogs);

    final debounceStream = events
        .where((event) => event is FetchDialogs)
        .debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<ConversationListState> mapEventToState(
    ConversationsListEvent event,
  ) async* {
    final currentState = state;

    if (event is FetchDialogs) {
      //   List<Conversation> list =
      //       await VKMessagesRemote(AccountsRepository().current.token)
      //           .getConversations(event.offset);

      //   yield DialogList(list);

      yield ConversationList((currentState is Loading
              ? List<DialogViewModel>()
              : (currentState as ConversationList).dialogs) +
          await MessagesService().getConversations(offset));
      offset += 10;
    }
  }
}
