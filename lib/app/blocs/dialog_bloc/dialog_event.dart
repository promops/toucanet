part of 'dialog_bloc.dart';

abstract class DialogEvent extends Equatable {
  const DialogEvent();
}

class FetchDialogs extends DialogEvent {
  FetchDialogs(this.offset);
  int offset;

  @override
  List<Object> get props => [];
}
