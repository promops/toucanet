import 'package:flutter/material.dart';
import 'package:toucanet/app/styles/app_colors.dart';

const double _kTabHeight = 46.0;

///Бар с навигацией
class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  final TabController controller;
  final int currentIndex;

  const CustomTabBar({Key key, this.tabs, this.controller, this.currentIndex})
      : assert(tabs != null),
        assert(controller != null),
        super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();

  @override
  Size get preferredSize => Size.fromHeight(_kTabHeight);
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  void initState() {
    super.initState();
  }

  void _handleTap(int index) {
    assert(index >= 0 && index < widget.tabs.length);
    widget.controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> wrappedTabs = List<Widget>(widget.tabs.length);

    for (int i = 0; i < widget.tabs.length; i++) {
      wrappedTabs[i] = InkWell(
        onTap: () => _handleTap(i),
        child: widget.tabs[i],
      );
    }

    return Container(
      height: _kTabHeight,
      decoration: BoxDecoration(
        color: AppColors.additionalColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: wrappedTabs),
    );
  }
}
