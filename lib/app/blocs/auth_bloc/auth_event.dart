part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable 
{}

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

class AuthHttpErrorEvent extends AuthEvent
{
  @override
  List<Object> get props => [];
}