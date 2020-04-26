import 'package:flutter/material.dart';

import '../../../../data/objects/user_model/user_counters_model.dart';
import '../../../styles/fonts.dart';
import '../../../styles/indents.dart';


class UserCountersWidget extends StatelessWidget {
  final UserCountersModel userCounters;

  const UserCountersWidget({Key key, this.userCounters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: Indents.medium,
          right: Indents.medium,
          top: Indents.large,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            UserCounterWidget(
              title: 'Друзья',
              count: userCounters.friends,
            ),
            UserCounterWidget(
              title: 'Фото',
              count: userCounters.photos,
            ),
            UserCounterWidget(
              title: 'Группы',
              count: userCounters.groups,
            ),
            UserCounterWidget(
              title: 'Альбомы',
              count: userCounters.albums,
            ),
          ],
        ));
  }
}

class UserCounterWidget extends StatelessWidget {
  final int count;
  final String title;
  const UserCounterWidget({Key key, this.count, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '$count',
          style: Fonts.h1,
        ),
        Text(
          title,
          style: Fonts.h1,
        )
      ],
    );
  }
}
