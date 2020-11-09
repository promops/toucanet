import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet_vk_sdk/toucanet_vk_sdk.dart';

import '../../../bloc/conversation/conversation_bloc.dart';
import '../../../domain/repositories/account_repository.dart';
import '../conversation/conversation_list_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConversationBloc>(
        create: (context) => ConversationBloc(
              VK(
                  accessToken: RepositoryProvider.of<AccountRepository>(context)
                      .current
                      .token),
            ),
        child: TabBarView(
            controller: _tabController, children: [ConversationListScreen()]));
  }
}
