part of 'auth_bloc.dart';

enum AuthStatus {
  denied,
  authenticated,
  authenticating,
  unauthenticated,
}

@immutable
class AuthState extends Equatable {
  final String authUrl;
  final AuthStatus status;

  const AuthState._({@required this.status, @required this.authUrl});

  const AuthState.unauthenticated(String url)
      : this._(status: AuthStatus.unauthenticated, authUrl: url);

  const AuthState.denied(String url)
      : this._(status: AuthStatus.denied, authUrl: url);

  const AuthState.authenticated(String url)
      : this._(status: AuthStatus.authenticated, authUrl: url);

  const AuthState.authenticating(String url)
      : this._(status: AuthStatus.authenticating, authUrl: url);

  @override
  String toString() => '$status';

  @override
  List<Object> get props => [status];
}
