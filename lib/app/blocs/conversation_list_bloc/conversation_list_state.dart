part of 'conversation_list_bloc.dart';

abstract class ConversationListState extends Equatable {
  const ConversationListState();
}

class ConversationList extends ConversationListState {
  ConversationList(this.dialogs);

  final List<ConversationViewModel> dialogs;

  @override
  List<Object> get props => [Random().nextInt(100)];
}

class Loading extends ConversationListState {
  @override
  List<Object> get props => [];
}

class Asd extends ConversationListState {
  @override
  List<Object> get props => [];
}
