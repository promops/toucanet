import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatefulWidget {
  String url;
  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: CachedNetworkImage(
              imageUrl: "https://www.zoosite.com.ua/img/poroda/319/319_1.jpg",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.fitHeight,
            )));
  }
}
