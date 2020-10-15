import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/repositories/account_repository.dart';
import 'data/repositories/account_repository_impl.dart';

class Injector extends StatelessWidget {
  final Widget app;

  const Injector({@required this.app, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AccountRepository>(
          create: (context) => AccountRepositoryImpl(),
        ),
      ],
      child: app,
    );
  }
}
