import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../messages/messages_list_page/messages_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        bottomNavigationBar: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.message),
              text: 'Чаты',
            ),
            Tab(
              icon: Icon(Icons.portrait),
              text: 'Профиль',
            )
          ],
        ),
        body: TabBarView(
            controller: _tabController,
            children: [MessagesListPage(), Container()]));
  }
}
