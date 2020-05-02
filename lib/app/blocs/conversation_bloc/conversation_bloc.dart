import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toucanet/data/objects/message/message.dart';

import '../../../data/remotes/vk_messages_remote.dart';
import '../../../data/repositories/accounts_repository.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  int offset = 0;

  @override
  ConversationState get initialState => Loading();

  @override
  Stream<Transition<ConversationEvent, ConversationState>> transformEvents(
      Stream<ConversationEvent> events,
      TransitionFunction<ConversationEvent, ConversationState> transitionFn
  ) {
      final nonDebounceStream = events
        .where((event) => event is! FetchMessages);

      final debounceStream = events
        .where((event) => event is FetchMessages)
        .debounceTime(Duration(milliseconds: 300));

      return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]),
        transitionFn,
      );
  }

  @override
  Stream<ConversationState> mapEventToState(
    ConversationEvent event,
  ) async* {
    final currentState = state;

    if (event is FetchMessages) {
      // var messages = await VKMessagesRemote(AccountsRepository().current.token)
      //     .getHistory(0, event.userId);
      //     print(messages);
      // yield MessagesList(messages);

      yield MessagesList((currentState is Loading
              ? List<Message>()
              : (currentState as MessagesList).messages) +
          await VKMessagesRemote(AccountsRepository().current.token)
              .getHistory(offset, event.userId));
      offset += 12;
    }
  }
}
