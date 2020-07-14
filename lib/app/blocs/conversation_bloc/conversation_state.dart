part of 'conversation_bloc.dart';

abstract class ConversationState extends Equatable {
  const ConversationState();
}

class ConversationInitial extends ConversationState {
  @override
  List<Object> get props => [];
}

class MessagesList extends ConversationState {
  MessagesList(this.messages);
  final List<MessageViewModel> messages;

  @override
  List<Object> get props => [Random().nextInt(100)];
}

class Loading extends ConversationState {
  @override
  List<Object> get props => [];
}
