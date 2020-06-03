import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toucanet/view/styles/app_colors.dart';

import '../../../../app/models/message_view_model.dart';
import '../../../../data/objects/message/attachments/models_by_type/audio.dart';
import '../../../../data/objects/message/attachments/models_by_type/photo.dart';
import '../../../../data/objects/message/attachments/models_by_type/sticker.dart';
import '../../../styles/fonts.dart';
import '../../../styles/indents.dart';
import 'attachment_widgets/audio_widget.dart';
import 'attachment_widgets/photo_widget.dart';
import 'attachment_widgets/sticker_widget.dart';

class Wrapper extends StatelessWidget {
  Wrapper({this.message, @required this.withPhoto, this.photoUrl});

  MessageViewModel message;

  String photoUrl;

  List<Widget> children;

  List<Widget> attachmentWidgets = [];

  bool withPhoto;

  @override
  Widget build(BuildContext context) {
    createAttachmentList();
    return Row(
      mainAxisAlignment:
          this.message.out ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
            margin: const EdgeInsets.only(
                top: Indents.small, bottom: Indents.small),
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: this.message.out
                    ? BorderRadius.horizontal(right: Radius.circular(15))
                    : BorderRadius.horizontal(left: Radius.circular(15)),
                color:
                    this.message.out ? Colors.grey[200] : AppColors.mainBlue),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              this.message.text.isEmpty
                  ? Container()
                  : Text(
                      this.message.text,
                      style: Fonts.h3.copyWith(
                          color:
                              this.message.out ? Colors.black : Colors.white),
                      maxLines: 50,
                      textAlign: TextAlign.left,
                    ),
              ...attachmentWidgets
            ])),
        this.withPhoto && this.message.out
            ? Padding(
                padding: EdgeInsets.only(left: Indents.medium),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                      width: 20,
                      height: 20,
                      child: CachedNetworkImage(imageUrl: this.photoUrl)),
                ))
            : Offstage()
      ],
    );
  }

  void createAttachmentList() {
    var attachList = this.message.attachments;

    if (attachList.isEmpty) return;

    for (var attach in attachList) {
      if (attach is Sticker) {
        attachmentWidgets.add(StickerWidget(url: attach.images[2].url));
        continue;
      }

      if (attach is Audio) {
        attachmentWidgets.add(AudioWidget(title: 'audio', url: attach.url));
        continue;
      }

      if (attach is Photo) {
        attachmentWidgets
            .add(PhotoWidget(url: attach.sizes[0].url, photo: attach));
        continue;
      }
    }
  }
}
