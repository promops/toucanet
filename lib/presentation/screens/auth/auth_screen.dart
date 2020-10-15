import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../settings.dart';
import '../../../bloc/auth/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  // ignore: prefer_interpolation_to_compose_strings
  static const url = '${Settings.oAuthUrl}authorize'
      '?response_type=token'
      '&v=${Settings.apiVersion}'
      '&client_id=${Settings.apiClientId}'
      '&scope=offline,status,groups,audio,video,photos,friends,messages'
      '&redirect_uri=${Settings.oAuthUrl}blank.html';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        onPageFinished: (url) =>
            context.bloc<AuthBloc>().add(AuthEvent.browserUpdate(url: url)),
        initialUrl: url,
      ),
    );
  }
}
