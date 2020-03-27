import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../styles/fonts.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/app_bar/widgets/backward_button.dart';
import '../messages/messages_list_page/dialog_list_page.dart';
import 'widgets/custom_tab_bar/custom_tab.dart';
import 'widgets/custom_tab_bar/custom_tab_bar.dart';

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
        appBar: CustomAppBar(
          leading: BackwardButton(),
          title: Text('Диалоги', style: Fonts.h1),
        ),
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
            children: [DialogListPage(), Container()]));
  }
}
