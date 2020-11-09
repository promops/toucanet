import 'package:meta/meta.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet_vk_sdk/toucanet_vk_sdk.dart';

import 'domain/repositories/account_repository.dart';
import 'data/repositories/account_repository_impl.dart';

import 'domain/repositories/auth_repository.dart';
import 'data/repositories/auth_repository_impl.dart';

class Injector extends StatelessWidget {
  final Widget app;
  final VK client;

  const Injector({@required this.app, @required this.client, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AccountRepository>(
          create: (context) => AccountRepositoryImpl(),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) =>
              AuthRepositoryImpl(RepositoryProvider.of(context), client),
        ),
      ],
      child: app,
    );
  }
}
