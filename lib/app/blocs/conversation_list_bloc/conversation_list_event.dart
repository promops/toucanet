part of 'conversation_list_bloc.dart';

abstract class ConversationsListEvent extends Equatable {
  const ConversationsListEvent();
}

class FetchDialogs extends ConversationsListEvent {

  @override
  List<Object> get props => [];
}

class NewMessages extends ConversationsListEvent{
  @override
  List<Object> get props => [];

}
