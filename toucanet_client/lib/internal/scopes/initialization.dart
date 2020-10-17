import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/app/app_bloc.dart';

class InitializationScope extends StatelessWidget {
  final Widget app;
  final Widget initial;

  const InitializationScope(
      {required this.app, required this.initial, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        RepositoryProvider.of(context),
      ),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          switch (state.status) {
            case AppStatus.loaded:
              return app;
            default:
              return initial;
          }
        },
      ),
    );
  }
}
