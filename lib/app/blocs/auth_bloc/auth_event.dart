part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable 
{}

class AuthBrowserLoginEvent extends AuthEvent
{
  @override
  List<Object> get props => [];
}

class AuthBrowserErrorEvent extends AuthEvent
{
  final String url;
  final String code;

  AuthBrowserErrorEvent(this.url, this.code);

  @override
  List<Object> get props => [url, code];
}

class AuthBrowserUpdateEvent extends AuthEvent
{
  final String url;

  AuthBrowserUpdateEvent(this.url);

  @override
  List<Object> get props => [url];
}

class AuthVKAppLoginEvent extends AuthEvent
{
  @override
  List<Object> get props => [];
}

class AuthSuccessEvent extends AuthEvent
{
  final String code;

  AuthSuccessEvent(this.code);

  @override
  List<Object> get props => [code];
}

class AuthErrorEvent extends AuthEvent
{
  @override
  List<Object> get props => [];
}