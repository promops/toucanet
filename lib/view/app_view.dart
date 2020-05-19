import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audio_service/audio_service.dart';

import './../app/blocs/app_bloc/app_bloc.dart';
import './../app/blocs/auth_bloc/auth_bloc.dart';

import './pages/auth_pages/auth_page.dart';
import './pages/home_page/home_page.dart';
import './pages/messages/dialog_page/dialog_page.dart';


class AppView extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
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

      home: AudioServiceWidget(
        child: BlocBuilder(
          bloc: BlocProvider.of<AppBloc>(context)..add(AppStarted()),
          builder: (context, state) 
          {
            if (state is! AppInitialState) return Offstage();
            if ((state as AppInitialState).isAuth) return HomePage();

            return AuthPage(BlocProvider.of<AuthBloc>(context));
          }),
        )
    );
  }
}
