import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet/app/blocs/dialog_bloc/dialog_bloc.dart';
import 'package:toucanet/app/blocs/user_bloc/user_bloc.dart';

import 'package:toucanet/data/services/account_service.dart';

class Injector extends StatelessWidget {
  final Key key;
  final Widget child;

  Injector({this.key, @required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AccountService>(create: (_) => AccountService()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>(
              create: (BuildContext context) => UserBloc(),
            ),
            BlocProvider<DialogBloc>(
                create: (BuildContext context) => DialogBloc())
          ],
          child: this.child,
        ));
  }
}
