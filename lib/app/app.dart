import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/services/account_service.dart';
import 'blocs/app_bloc/app_bloc.dart';
import 'pages/auth_pages/auth_page.dart';
import 'pages/home_page/home_page.dart';
import 'pages/messages/dialog_page/dialog_page.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

Future<dynamic> backgroundHandle(Map<String, dynamic> message) {
  print('$message');
}

class _AppState extends State<App> {
  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) {
    //    // print('on message ${message}');
    //    // PushManager().displayNotification('фыв');
    //   },
    //   onResume: (Map<String, dynamic> message) {
    //     //print('on resume $message');
    //   },
    //   onLaunch: (Map<String, dynamic> message) {
    //     //print('on launch $message');
    //   },
    //   onBackgroundMessage: backgroundHandle,
    // );
    // _firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(sound: true, badge: true, alert: true));
    // _firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //  // print("Settings registered: $settings");
    // });

    // _firebaseMessaging.getToken().then((String token) {
    //   assert(token != null);
    //  // print(token);
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AccountService accountService =
        RepositoryProvider.of<AccountService>(context);

    return MaterialApp(
      home: BlocBuilder(
          bloc: AppBloc(accountService)..add(AppStarted()),
          builder: (context, state) {
            if (state is! AppInitialState) return Offstage();
            return (state as AppInitialState).isAuth
                ? HomePage()
                : AuthPage(accountService);
          }),
      title: 'toucanet',
      theme: ThemeData(fontFamily: 'Montserrat', primarySwatch: Colors.blue),
      routes: {
        '/main': (context) => HomePage(),
        '/dialog': (context) => DialogPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
