import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toucanet/core/vk/vk_api_client.dart';
import 'package:toucanet/data/objects/message/message.dart';

import '../../../data/remotes/vk_messages_remote.dart';
import '../../../data/repositories/accounts_repository.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  int offset = 0;
  int currentId = 0;
  Message currentMessage;

  ConversationBloc() {
    VKApiLongPoll().stream.listen((event) {
      currentMessage = Message.fromJson(event);

      this.add(NewMessage());
    });
  }

  @override
  ConversationState get initialState => Loading();

  @override
  Stream<Transition<ConversationEvent, ConversationState>> transformEvents(
      Stream<ConversationEvent> events,
      TransitionFunction<ConversationEvent, ConversationState> transitionFn) {
    final nonDebounceStream = events.where((event) => event is! FetchMessages);

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
    if (event is FetchMessages) {
      currentId = event.userId;
      yield MessagesList((state is Loading
              ? List<Message>()
              : (state as MessagesList).messages) +
          await VKMessagesRemote(AccountsRepository().current.token)
              .getHistory(offset, event.userId));
      if (event.changeOffset) offset += 12;
    }

    if (event is NewMessage) {
      if (currentMessage.fromId == currentId && state is! MessagesList) {
        yield MessagesList([currentMessage] + (state as MessagesList).messages);
      }
    }

    if (event is Reset) {
      offset = 0;
      yield initialState;
    }
  }
}
