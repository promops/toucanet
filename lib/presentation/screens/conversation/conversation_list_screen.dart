import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/conversation/conversation_bloc.dart';
import '../splash/splash_screen.dart';

class ConversationListScreen extends StatefulWidget {
  @override
  _ConversationListScreenState createState() => _ConversationListScreenState();
}

class _ConversationListScreenState extends State<ConversationListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ConversationBloc, ConversationState>(
        cubit: BlocProvider.of<ConversationBloc>(context)
          ..add(const LoadConversations()),
        builder: (context, state) {
          if (state is ConversationList) return const Text('test');

          return const SplashScreen();
        },
      ),
    );
  }
}
