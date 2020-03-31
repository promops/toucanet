import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../styles/indents.dart';

class UserAvatar extends StatelessWidget {
  final String url;


  const UserAvatar({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(left: Indents.medium, top: Indents.large, right:Indents.medium,),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(imageUrl: url)));
  }
}
