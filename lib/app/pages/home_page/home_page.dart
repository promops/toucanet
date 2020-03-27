import 'package:flutter/material.dart';
import 'package:toucanet/app/pages/home_page/widgets/custom_tab_bar/custom_tab.dart';
import 'package:toucanet/app/pages/home_page/widgets/custom_tab_bar/custom_tab_bar.dart';

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
        bottomNavigationBar: CustomTabBar(
          controller: _tabController,
          tabs: <Widget>[
            CustomTab(
              child: ImageIcon(
                AssetImage('assets/icons/mail.png'),
                color: Colors.white,
              ),
            ),
            CustomTab(
              child: ImageIcon(
                AssetImage('assets/icons/user.png'),
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: TabBarView(
            controller: _tabController,
            children: [MessagesListPage(), Container()]));
  }
}
