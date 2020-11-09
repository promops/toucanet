import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:toucanet_vk_sdk/toucanet_vk_sdk.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  ConversationBloc(
    this.vk,
  ) : super(ConversationInitial());

  final VK vk;

  @override
  Stream<ConversationState> mapEventToState(
    ConversationEvent event,
  ) async* {
    if (event is LoadConversations) {
      final response = await vk.messages.getConversations(1);
      yield ConversationList();
    }
  }
}
