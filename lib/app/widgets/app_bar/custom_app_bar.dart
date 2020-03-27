import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../styles/indents.dart';

const double _kAppBarHeight = 46.0;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key key, this.leading, this.trailing, this.title})
      : assert(leading != null),
        super(key: key);

  final Widget leading;
  final Widget trailing;
  final Widget title;

  @override
  Size get preferredSize => Size.fromHeight(_kAppBarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Container(
            height: _kAppBarHeight,
            decoration: BoxDecoration(
              color: AppColors.additionalColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(14),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Indents.large),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  leading ?? Container(),
                  title ?? Container(),
                  trailing ?? Container()
                ],
              ),
            )));
  }
}
