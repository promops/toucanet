import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:toucanet/data/services/auth_service.dart';

import 'package:toucanet/app/application.dart';
import 'package:toucanet/app/blocs/app_bloc/app_bloc.dart';
import 'package:toucanet/app/blocs/auth_bloc/auth_bloc.dart';
import 'package:toucanet/app/blocs/user_bloc/user_bloc.dart';
import 'package:toucanet/app/blocs/conversation_bloc/conversation_bloc.dart';

class AppInjector extends StatelessWidget 
{
  final Key key;
  final Widget child;
  final Application app;

  AppInjector({this.app, this.key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => this.app.authService),
        RepositoryProvider(create: (_) => this.app.messagesRemote),
        RepositoryProvider(create: (_) => this.app.messagesService),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (BuildContext context) => 
              AppBloc(RepositoryProvider.of(context)),
          ),
          
          BlocProvider<AuthBloc>(
            create: (BuildContext context) => 
              AuthBloc(RepositoryProvider.of(context)),
          ),

          BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(),
          ),
          
          BlocProvider<ConversationBloc>(
            create: (BuildContext context) => ConversationBloc(RepositoryProvider.of(context)),
          )
        ],
        child: this.child,
      ));
  }

  
}
