import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:toucanet/data/services/account_service.dart';

import 'package:toucanet/app/blocs/app_bloc/app_bloc.dart';

import 'package:toucanet/app/pages/home_page/home_page.dart';
import 'package:toucanet/app/pages/auth_pages/auth_page.dart';
import 'package:toucanet/app/pages/messages/dialog_page/dialog_page.dart';

class App extends StatelessWidget 
{
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