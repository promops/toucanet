import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toucanet/app/models/message_view_model.dart';

import 'package:toucanet/data/services/messages_service.dart';
import 'package:toucanet/data/repositories/conversations_repository.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  int offset = 0;
  int currentId = 0;
  MessageViewModel currentMessage;
  MessagesService messagesService;

  ConversationBloc(this.messagesService) : super(Loading()) {
    ConversationsRepository().onChange = () => this.add(NewMessage());
  }


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
              ? List<MessageViewModel>()
              : (state as MessagesList).messages) +
          await messagesService.getHistory(offset, event.userId));
      if (event.changeOffset) offset += 12;
    }

    if (event is NewMessage) {
      yield MessagesList(await messagesService.getHistory(0, currentId));
    }
  }
}
