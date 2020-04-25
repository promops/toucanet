part of 'conversation_bloc.dart';

abstract class ConversationEvent extends Equatable {
  const ConversationEvent();
}

class FetchMessages extends ConversationEvent {
  FetchMessages(this.userId);
  int userId;

  @override
  List<Object> get props => [userId];
}
