import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../data/objects/message/attachments/models_by_type/photo.dart';

class PhotoViewPage extends StatelessWidget {
  final Photo photo;

  PhotoViewPage({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
         imageProvider: NetworkImage(this.photo.sizes[2].url)
    )
    );
  }
}