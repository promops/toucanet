import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/repositories/auth_repository.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository)
      : super(_authRepository.isAuth
            ? const AuthState.authenticated()
            : const AuthState.unauthenticated());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is _AuthLogoutEvent) {
      yield* _mapAuthLogoutEventToState(event);
    }

    if (event is _AuthBrowserUpdateEvent) {
      yield* _mapAuthBrowserUpdateEventToState(event);
    }
  }

  Stream<AuthState> _mapAuthLogoutEventToState(_AuthLogoutEvent event) async* {
    // await _authRepository.logout();
    yield const AuthState.unauthenticated();
  }

  Stream<AuthState> _mapAuthBrowserUpdateEventToState(
    _AuthBrowserUpdateEvent event,
  ) async* {
    try {
      await _authRepository.browserAuth(event.url);
      yield const AuthState.authenticated();
    } on Exception catch (_) {
      yield const AuthState.denied();
    }
  }
}
