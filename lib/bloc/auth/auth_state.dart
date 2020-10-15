part of 'auth_bloc.dart';

enum AuthStatus {
  denied,
  authenticated,
  authenticating,
  unauthenticated,
}

@immutable
class AuthState extends Equatable {
  final AuthStatus status;

  const AuthState._({this.status});

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  const AuthState.denied() : this._(status: AuthStatus.denied);

  const AuthState.authenticated() : this._(status: AuthStatus.authenticated);

  const AuthState.authenticating() : this._(status: AuthStatus.authenticating);

  @override
  String toString() => '$status';

  @override
  List<Object> get props => [status];
}
