import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:toucanet/core/notification/push_manager.dart';

import 'package:toucanet/data/services/account_service.dart';

import 'package:toucanet/app/blocs/app_bloc/app_bloc.dart';

import 'package:toucanet/app/pages/home_page/home_page.dart';
import 'package:toucanet/app/pages/auth_pages/auth_page.dart';
import 'package:toucanet/app/pages/messages/dialog_page/dialog_page.dart';

class App extends StatefulWidget 
{

  @override
  _AppState createState() => _AppState();
}

Future<dynamic> backgroundHandle(Map<String, dynamic> message){
    print('$message');
    //PushManager().displayNotification('фыв');
  }

class _AppState extends State<App> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();



  @override
  void initState() {



    print('123');
        _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('on message ${message}');
        //print('on message');
        dynamic text = message['data']['context'];

        String id = json.decode(text)['msg_id'];
        print('$text');
        print(id);
        PushManager().displayNotification('фыв');
      },
      onResume: (Map<String, dynamic> message) {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('on launch $message');
      },
      
      onBackgroundMessage: backgroundHandle,


    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });

    
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print(token);
    });

 

 
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) 
  {
    final AccountService accountService = RepositoryProvider.of<AccountService>(context);
    
    return MaterialApp(

      home: 
        BlocBuilder(
          bloc: AppBloc(accountService)..add(AppStarted()),
          builder: (context, state) 
          {
            if (state is! AppInitialState) return Offstage();
            return (state as AppInitialState).isAuth ? HomePage() : AuthPage(accountService);
          }
        ),
      
      title: 'toucanet',

      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue
      ),

      routes: {
        '/main': (context) => HomePage(),
        '/dialog': (context) => DialogPage(),
      },

      debugShowCheckedModeBanner: false,
    );
  }
}