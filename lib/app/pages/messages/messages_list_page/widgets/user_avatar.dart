import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toucanet/app/styles/indents.dart';

class UserAvatar extends StatefulWidget {
  String url;
  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(Indents.medium),
        child: Container(
          width: 80,
          height: 80,
          child: Shimmer(
            loop: 2,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://www.zoosite.com.ua/img/poroda/319/319_1.jpg",
                  //placeholder: (context, url) =>
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                )),
            gradient: LinearGradient(colors: [Colors.grey, Colors.grey[200]]),
          ),
        ));
  }
}
