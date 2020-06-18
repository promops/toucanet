import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toucanet/app/models/conversation_view_model.dart';
import 'package:toucanet/data/repositories/conversations_repository.dart';

import '../../../data/services/messages_service.dart';

part 'conversation_list_event.dart';
part 'conversation_list_state.dart';

class ConversationListBloc
    extends Bloc<ConversationsListEvent, ConversationListState> {
  final MessagesService messagesService;
  var messagesList = [];

  ConversationListBloc(this.messagesService) {
    // this.messagesService.onMessage.listen((event) {
    //   //TODO Проверка нужна на сообщение
    //   this.add(NewMessages());
    // });

    this.messagesService.initLonpull();

    ConversationsRepository().onChange = () => this.add(NewMessages());
  }

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

    // if (event is FetchDialogs) {

    //   yield ConversationList((currentState is Loading
    //           ? List<ConversationViewModel>()
    //           : (currentState as ConversationList).dialogs) +
    //       await this.messagesService.getConversations(offset));
    //   offset += 10;
    // }

    if (event is FetchDialogs) {
      await this.messagesService.getConversations(0);
      messagesList = ConversationsRepository().getConversations();
      yield ConversationList(messagesList);
    }

    if (event is NewMessages) {
      print('new messages');
      //print(ConversationsRepository().getConversations()[0].lastMessage);
      messagesList = ConversationsRepository().getConversations();
     // print(messagesList);
      yield ConversationList(messagesList);
      //yield Asd();
    }
  }
}
