import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/message/message.dart';
import '../../../data/remotes/vk_messages_remote.dart';
import '../../../data/repositories/accounts_repository.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  @override
  ConversationState get initialState => Loading();

  @override
  Stream<ConversationState> mapEventToState(
    ConversationEvent event,
  ) async* {
    if (event is FetchMessages) {
      var messages = await VKMessagesRemote(AccountsRepository().current.token)
          .getHistory(0, event.userId);
      yield MessagesList(messages);
    }
  }
}
