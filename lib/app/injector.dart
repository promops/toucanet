import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:toucanet/data/repositories/account_repository.dart';

class Injector extends StatelessWidget 
{
  final Key key;
  final Widget child;

  Injector({this.key, @required this.child});

  @override
  Widget build(BuildContext context) 
  {
    return MultiRepositoryProvider(
      providers: 
      [
        RepositoryProvider<AccountRepository>(create: (_) => AccountRepository()),
      ],

      child: this.child,
    );
  }
}