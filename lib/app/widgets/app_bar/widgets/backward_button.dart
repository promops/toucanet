import 'package:flutter/material.dart';

///Кнопка возврата назад
class BackwardButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        child: ImageIcon(AssetImage('assets/icons/backward_button_icon.png'),
            color: Colors.white),
      ),
    );
  }
}
