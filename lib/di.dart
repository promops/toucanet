import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Injector extends StatelessWidget {
  final Widget app;

  const Injector({@required this.app, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: const [],
        child: app,
      );
}
