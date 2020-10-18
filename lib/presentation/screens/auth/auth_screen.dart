import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../bloc/auth/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: context.bloc<AuthBloc>().state.authUrl,
        onPageFinished: (url) {
          context.bloc<AuthBloc>().add(AuthEvent.browserUpdate(url: url));
        },
      ),
    );
  }
}
