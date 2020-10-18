import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';

class AuthenticationScope extends StatelessWidget {
  final Widget auth;
  final Widget home;

  const AuthenticationScope({@required this.auth, @required this.home, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(RepositoryProvider.of(context)),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          switch (state.status) {
            case AuthStatus.authenticated:
              return home;
            default:
              return auth;
          }
        },
      ),
    );
  }
}
