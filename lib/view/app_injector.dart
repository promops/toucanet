import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:toucanet/data/services/account_service.dart';

import 'package:toucanet/app/blocs/app_bloc/app_bloc.dart';
import 'package:toucanet/app/blocs/auth_bloc/auth_bloc.dart';
import 'package:toucanet/app/blocs/user_bloc/user_bloc.dart';
import 'package:toucanet/app/blocs/conversation_bloc/conversation_bloc.dart';

class AppInjector extends StatelessWidget 
{
  final Key key;
  final Widget child;

  AppInjector({this.key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AccountService>(create: (_) => AccountService()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AppBloc>(
              create: (BuildContext context) => 
                AppBloc(RepositoryProvider.of<AccountService>(context)),
            ),
            
            BlocProvider<AuthBloc>(
              create: (BuildContext context) => 
                AuthBloc(RepositoryProvider.of<AccountService>(context)),
            ),





            BlocProvider<UserBloc>(
              create: (BuildContext context) => UserBloc(),
            ),
            BlocProvider<ConversationBloc>(
              create: (BuildContext context) => ConversationBloc(),
            )
          ],
          child: this.child,
        ));
  }
}
