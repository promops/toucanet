import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/repositories/account_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AccountRepository _accountRepository;

  AppBloc(this._accountRepository)
      : assert(_accountRepository != null),
        super(const AppState.unknown()) {
    add(AppEvent.started());
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is _AppStarted) yield* _mapAppStartedEventToState(event);
  }

  Stream<AppState> _mapAppStartedEventToState(_AppStarted event) async* {
    try {
      await _accountRepository.load();
    } on Exception catch (_) {}

    yield const AppState.loaded();
  }
}
