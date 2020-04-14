import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dialog_event.dart';
part 'dialog_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  @override
  DialogState get initialState => DialogInitial();

  @override
  Stream<DialogState> mapEventToState(
    DialogEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
