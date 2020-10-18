part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  factory AuthEvent.logout() => _AuthLogoutEvent();

  factory AuthEvent.browserUpdate({@required String url}) =>
      _AuthBrowserUpdateEvent(url: url);

  @override
  List<Object> get props => [];
}

class _AuthBrowserUpdateEvent extends AuthEvent {
  final String url;

  const _AuthBrowserUpdateEvent({@required this.url});

  @override
  List<Object> get props => [url];
}

class _AuthLogoutEvent extends AuthEvent {}
