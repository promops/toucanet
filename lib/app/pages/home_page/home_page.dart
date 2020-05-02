import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../messages/messages_list_page/dialog_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Widget> items;
  List<Widget> pages;
  TabController _controller;
  int current = 0;

  @override
  initState() {
    items = [
      _scrollItem('Сообщения', 0),
      _scrollItem('Профиль', 1),
      _scrollItem('Новости', 2),
    ];

    pages = [DialogListPage(), Container(), Container()];

    _controller = TabController(length: items.length, vsync: this);
    super.initState();
  }

  Widget _scrollItem(String title, int index) {
    return Padding(
        padding: const EdgeInsets.only(right: 20, top: 60),
        child: Text(
          title,
          style: TextStyle(
              color: index == current
                  ? Colors.white
                  : Colors.white.withOpacity(0.4),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ));
  }

  List<Widget> initTitles() => [
        _scrollItem('Сообщения', 0),
        _scrollItem('Профиль', 1),
        _scrollItem('Новости', 2),
      ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBlue,
        body: SafeArea(
            top: true,
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Stack(
                  children: <Widget>[
                    TabBar(
                      indicatorWeight: 0.0001,
                      isScrollable: true,
                      controller: _controller,
                      tabs: items,
                      onTap: (index) => setState(
                          () => {current = index, items = initTitles()}),
                      unselectedLabelStyle: TextStyle(color: Colors.red),
                      labelStyle: TextStyle(fontSize: 12),
                    ),
                    // TabBarView(
                    //     physics: PageScrollPhysics(),
                    //     controller: _controller,
                    //     children: pages
                    //     //DialogListPage()

                    //     )
                    //DialogListPage()
                    pages[current]
                  ],
                )),
              ],
            )));
  }
}
