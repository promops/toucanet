import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  @override
  ConversationState get initialState => ConversationInitial();

  @override
  Stream<ConversationState> mapEventToState(
    ConversationEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
