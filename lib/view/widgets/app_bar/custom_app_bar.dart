import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../styles/indents.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key key, this.leading, this.trailing, this.title})
      : super(key: key);

  final Widget leading;
  final Widget trailing;
  final Widget title;

  @override
  Size get preferredSize => Size.fromHeight(Indents.kAppBarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Container(
          height: Indents.kAppBarHeight,
          decoration: BoxDecoration(
            color: AppColors.background,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              leading ?? Container(),
              title ?? Container(),
              trailing ?? Container()
            ],
          ),
        ));
  }
}
