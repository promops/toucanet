import 'package:flutter/material.dart';
import 'package:toucanet/view/styles/app_colors.dart';
import 'package:toucanet/view/styles/indents.dart';

///Кнопка возврата назад
class BackwardButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
        child: InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: Indents.kAppBarHeight,
        margin:
            const EdgeInsets.only(left: Indents.medium, right: Indents.medium),
        child: ImageIcon(AssetImage('assets/icons/backward_button_icon.png'),
            color: Colors.grey[700]),
      ),
    ));
  }
}
