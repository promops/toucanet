import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class AuthPage extends StatefulWidget 
{
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> 
{
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) 
  {
    flutterWebViewPlugin.onHttpError.listen((WebViewHttpError error) 
    {
      if (mounted) {
          print('onHttpError: ${error.code} ${error.url}');
      }
    });

    return 
    SafeArea(
      child: 
      WebviewScaffold(
        url: 'https://oauth.vk.com/authorize?client_id=7378583&redirect_uri=https://oauth.vk.com/blank.html',
      )
    );


  }
}