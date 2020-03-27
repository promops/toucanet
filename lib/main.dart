import 'package:flutter/material.dart';

import 'app/pages/home_page/home_page.dart';
import 'app/pages/messages/dialog_page/dialog_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'toucanet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/dialog': (context) => DialogPage(),
      },
    );
  }
}
