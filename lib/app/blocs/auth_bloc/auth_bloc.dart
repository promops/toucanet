import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:toucanet/data/services/auth_service.dart';
import 'package:toucanet/data/services/account_service.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> 
{
  final AccountService accountService;
  final AuthService _authService = AuthService();

  AuthBloc(this.accountService);

  @override
  AuthState get initialState => AuthInitState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* 
  {
    if (event is AuthBrowserLoginEvent)
    {
      yield AuthBrowserLoginState(this._authService.authUrl);
    }


    if (event is AuthBrowserUpdateEvent) 
    {
      try {
        final account = this._authService.browserAuth(event.url);

        if (account != null) 
        {
          await accountService.addAccount(account);
          yield AuthSuccessState();
        }
      }
      catch(_) { yield AuthAccessDeniedState(); }
    }


    if (event is AuthBrowserErrorEvent) 
    {
      if (event.url == this._authService.authUrl) yield AuthErrorState();
    }

  }
}