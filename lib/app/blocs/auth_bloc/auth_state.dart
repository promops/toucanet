part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable 
{}

class AuthInitState extends AuthState
{
  @override
  List<Object> get props => [];
}

class AuthBrowserLoginState extends AuthState
{
  final authUrl;

  AuthBrowserLoginState(this.authUrl);

  @override
  List<Object> get props => [authUrl];
}

class AuthVKAppLoginState extends AuthState
{
  @override
  List<Object> get props => [];
}

class AuthSuccessState extends AuthState
{
  @override
  List<Object> get props => [];
}

class AuthAccessDeniedState extends AuthState
{
  @override
  List<Object> get props => [];
}

class AuthErrorState extends AuthState
{
  @override
  List<Object> get props => [];
}