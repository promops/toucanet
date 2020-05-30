import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toucanet/view/styles/app_colors.dart';
import 'package:toucanet/view/styles/indents.dart';


class UserAvatar extends StatefulWidget {
  final String url;
  final bool online;

  UserAvatar({this.url, this.online});
  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Indents.medium),
        child: Stack(
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: CachedNetworkImage(
                    imageUrl: widget.url == null
                        ? "https://www.zoosite.com.ua/img/poroda/319/319_1.jpg"
                        : widget.url,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  )),
            ),
            widget.online ? Positioned(
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  color: AppColors.mainColor,
                  child: Padding(
                    padding: const EdgeInsets.all(Indents.small),
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ) : Offstage(),
          ],
        ));
  }
}
