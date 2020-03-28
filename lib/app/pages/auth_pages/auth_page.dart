import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:toucanet/data/services/account_service.dart';
import 'package:toucanet/app/blocs/auth_bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget
{
  final AuthBloc authBloc;
  final AccountService accountService;
  final FlutterWebviewPlugin webviewPlugin = FlutterWebviewPlugin();
  
  AuthPage(this.accountService) : 
    this.authBloc = AuthBloc(accountService);

  @override
  Widget build(BuildContext context) 
  {
    webviewPlugin.onUrlChanged.listen((url) => authBloc.add(AuthBrowserUpdateEvent(url)));
    webviewPlugin.onHttpError.listen((error) => authBloc.add(AuthBrowserErrorEvent(error.url, error.code)));

    return SafeArea(
      child: 
        BlocListener(
          bloc: authBloc,
          listener: (_, state) 
          {
            if (state is AuthSuccessState) 
            {
              webviewPlugin.hide();
              Navigator.pushReplacementNamed(context, '/main');
            }
          },
          child: 
            BlocBuilder(
              bloc: authBloc..add(AuthBrowserLoginEvent()),
              builder: (context, state) 
              {
                if (state is AuthErrorState) return Container(color: Colors.red);
                if (state is AuthSuccessState) return Container(color: Colors.green);
                if (state is AuthAccessDeniedState) return Container(color: Colors.yellow);

                if (state is! AuthBrowserLoginState) return Offstage();

                return WebviewScaffold(url: (state as AuthBrowserLoginState).authUrl);
              }
            ),
        )
    );
  }
}