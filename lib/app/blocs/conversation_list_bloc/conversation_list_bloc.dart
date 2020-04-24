import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/message/conversation.dart';
import '../../../data/remotes/vk_messages_remote.dart';
import '../../../data/repositories/accounts_repository.dart';

part 'conversation_list_event.dart';
part 'conversation_list_state.dart';

class ConversationListBloc extends Bloc<ConversationsListEvent, ConversationListState> {
  @override
  ConversationListState get initialState => Loading();

  int offset = 0;

  @override
  Stream<ConversationListState> mapEventToState(
    ConversationsListEvent event,
  ) async* {
    final currentState = state;

    print(event);
    if (event is FetchDialogs) {
      //   List<Conversation> list =
      //       await VKMessagesRemote(AccountsRepository().current.token)
      //           .getConversations(event.offset);

      //   yield DialogList(list);

      yield ConversationList((currentState is Loading
              ? List<Conversation>()
              : (currentState as ConversationList).dialogs) +
          await VKMessagesRemote(AccountsRepository().current.token)
              .getConversations(offset));
      offset += 10;
    }
  }
}
