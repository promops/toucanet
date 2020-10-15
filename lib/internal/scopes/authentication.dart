import 'package:flutter/material.dart';

// import '../../bloc/auth/auth_bloc.dart';
// import '../../bloc/registration/registration_bloc.dart';

class AuthenticationScope extends StatelessWidget {
  final Widget auth;
  final Widget home;

  const AuthenticationScope({this.auth, this.home, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (context) => AuthBloc(RepositoryProvider.of(context)),
    //     ),
    //     BlocProvider(
    //       create: (context) => RegistrationBloc(RepositoryProvider.of(context)),
    //     ),
    //   ],
    //   child: BlocBuilder<AuthBloc, AuthState>(
    //     builder: (context, state) {
    //       switch (state.status) {
    //         case AuthStatus.authenticated:
    //           return home;
    //         default:
    //           return auth;
    //       }
    //     },
    //   ),
    // );
  }
}
