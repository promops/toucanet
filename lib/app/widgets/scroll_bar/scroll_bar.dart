import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollBar extends StatefulWidget {
  @override
  _ScrollBarState createState() => _ScrollBarState();
}

class _ScrollBarState extends State<ScrollBar> {
  List<Widget> items;

  ItemScrollController _controller;

  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  void _scrollListener() {
     print(itemPositionsListener.itemPositions);
  }

  @override
  initState() {
    items = [
      _scrollItem('Сообщения'),
      _scrollItem('Профиль'),
      _scrollItem('Новости'),
      _scrollItem(''),
      _scrollItem(''),
      _scrollItem('')
    ];
    _controller = ItemScrollController();
    itemPositionsListener.itemPositions.addListener(_scrollListener);
    super.initState();
  }

  Widget _scrollItem(String title) {
    return Padding(
        padding: const EdgeInsets.only(right: 60), child: Text(title));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: ScrollablePositionedList.builder(
          scrollDirection: Axis.horizontal,
          itemScrollController: _controller,
          itemCount: items.length,
          itemPositionsListener: itemPositionsListener,
          itemBuilder: (context, index) {
            return items[index];
          },
        )
        
        );
  }
}
