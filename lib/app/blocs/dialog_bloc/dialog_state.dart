part of 'dialog_bloc.dart';

abstract class DialogState extends Equatable {
  const DialogState();
}

class DialogInitial extends DialogState {
  @override
  List<Object> get props => [];
}

class DialogList extends DialogState {
  DialogList(this.dialogs);

  List<Conversation> dialogs;

  @override
  List<Object> get props => [];
}
