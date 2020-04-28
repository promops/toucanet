import 'package:flutter/material.dart';
import 'package:toucanet/app/styles/fonts.dart';
import 'package:toucanet/app/widgets/scroll_bar/scroll_bar.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            backgroundColor: AppColors.mainColor,
            body: Column(
              children: <Widget>[
                Expanded(
                    child: Container(
                        color: AppColors.mainBlue,
                        child: Stack(
                          children: <Widget>[ScrollBar(), DialogListPage()],
                        ))),
              ],
            )));
  }
}
