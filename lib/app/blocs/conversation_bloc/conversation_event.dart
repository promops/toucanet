part of 'conversation_bloc.dart';

abstract class ConversationEvent extends Equatable {
  const ConversationEvent();
}

class FetchMessages extends ConversationEvent {
  FetchMessages(this.userId, {this.changeOffset = true});
  int userId;
  bool changeOffset;

  @override
  List<Object> get props => [userId];
}

class NewMessage extends ConversationEvent {
  @override
  List<Object> get props => [];
}

class Reset extends ConversationEvent {
  @override
  List<Object> get props => [];
}
