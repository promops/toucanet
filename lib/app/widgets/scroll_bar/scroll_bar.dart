import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toucanet/app/styles/indents.dart';

class ScrollBar extends StatefulWidget {
  @override
  _ScrollBarState createState() => _ScrollBarState();
}

class _ScrollBarState extends State<ScrollBar> {
  PageController _controller =
      PageController(initialPage: 1, viewportFraction: 1 / 3);

  Widget _scrollItem(String title) {
    return Padding(
      padding: EdgeInsets.only(right: 30),
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: PageView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _scrollItem('Сообщения'),
            _scrollItem('Новости'),
            _scrollItem('Профиль'),
          ],
        ));
  }
}
