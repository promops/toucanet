part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable 
{}

class AuthInitState extends AuthState
{
  @override
  List<Object> get props => [];
}

class AuthSignInState extends AuthState
{
  @override
  List<Object> get props => [];
}