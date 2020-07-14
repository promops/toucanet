import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:toucanet/data/services/auth_service.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitState());

  // @override
  // AuthState get initialState => AuthInitState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthBrowserLoginEvent) {
      yield AuthBrowserLoginState(this._authService.authUrl);
    }

    if (event is AuthBrowserUpdateEvent) {
      try {
        await this._authService.browserAuth(event.url);
        yield AuthSuccessState();
      } catch (_) {
        yield AuthAccessDeniedState();
        //TODO: исправить ошибку авторизации за ЕГОРОМ
      }
    }

    if (event is AuthBrowserErrorEvent) {
      if (event.url == this._authService.authUrl) yield AuthErrorState();
    }
  }
}
