part of 'dialog_bloc.dart';

abstract class DialogState extends Equatable {
  const DialogState();
}

class DialogInitial extends DialogState {
  @override
  List<Object> get props => [];
}
