import 'package:flutter/material.dart';
import 'package:toucanet/app/styles/fonts.dart';

import '../../styles/app_colors.dart';
import '../messages/messages_list_page/dialog_list_page.dart';
import '../user_profile_page/user_profile_page.dart';
import 'widgets/custom_tab_bar/custom_tab.dart';
import 'widgets/custom_tab_bar/custom_tab_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;

  List<Widget> tabs = [
    DialogListPage(),
    UserProfilePage(),
  ];

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

  void _handleTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors.additionalColor,
          unselectedItemColor: Colors.grey[700],
          selectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: _handleTap,
          items: [
            BottomNavigationBarItem(
              title: Text('Диалоги'),
              icon: ImageIcon(
                AssetImage('assets/icons/mail.png'),
              ),
            ),
            BottomNavigationBarItem(
               title: Text('Профиль'),
              icon: ImageIcon(
                AssetImage('assets/icons/user.png'),
              ),
            )
          ],
        ),
        body: tabs[_currentIndex]);
  }
}
