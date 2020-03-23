import 'package:flutter/material.dart';

const double _kTabHeight = 46.0;
const double _kTextAndIconTabHeight = 72.0;

///Бар с навигацией
class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  final TabController controller;
  final double indicatorWeight;

  const CustomTabBar({Key key, this.tabs, this.controller, this.indicatorWeight = 2.0})
      : assert(tabs != null),
        super(key: key);
  @override
  _CustomTabBarState createState() => _CustomTabBarState();

  @override
  Size get preferredSize {
    for (final Widget item in tabs) {
      if (item is Tab) {
        final Tab tab = item;
        if ((tab.text != null || tab.child != null) && tab.icon != null)
          return Size.fromHeight(_kTextAndIconTabHeight + indicatorWeight);
      }
    }
    return Size.fromHeight(_kTabHeight + indicatorWeight);
  }
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
