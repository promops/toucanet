import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/message/conversation.dart';
import '../../../data/remotes/vk_messages_remote.dart';
import '../../../data/repositories/accounts_repository.dart';

part 'dialog_event.dart';
part 'dialog_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  @override
  DialogState get initialState => DialogInitial();

  @override
  Stream<DialogState> mapEventToState(
    DialogEvent event,
  ) async* {
    if (event is FetchDialogs) {
      List<Conversation> list =
          await VKMessagesRemote(AccountsRepository().current.token)
              .getConversations(event.offset);

      yield DialogList(list);
    }
  }
}
