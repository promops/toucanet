import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../data/objects/message/attachments/models_by_type/photo.dart';
import '../../../photo_view_page/photo_view_page.dart';

class PhotoWidget extends StatelessWidget {
  final String url;
  final Photo photo;

  const PhotoWidget({Key key, this.url, this.photo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => PhotoViewPage(
                      photo: this.photo,
                    ))),
        child: Container(
          child: CachedNetworkImage(imageUrl: this.url),
        ));
  }
}
