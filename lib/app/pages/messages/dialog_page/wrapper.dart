import 'package:flutter/material.dart';

import '../../../../data/objects/message/attachments/models_by_type/audio.dart';
import '../../../../data/objects/message/attachments/models_by_type/photo.dart';
import '../../../../data/objects/message/attachments/models_by_type/sticker.dart';
import '../../../../data/objects/message/message.dart';
import '../../../styles/fonts.dart';
import '../../../styles/indents.dart';
import 'attachment_widgets/audio_widget.dart';
import 'attachment_widgets/photo_widget.dart';
import 'attachment_widgets/sticker_widget.dart';

class Wrapper extends StatelessWidget {
  Wrapper({this.message, @required this.withPhoto});

  Message message;

  List<Widget> children;

  List<Widget> attachmentWidgets = [];

  bool withPhoto;

  @override
  Widget build(BuildContext context) {
    createAttachmentList();
    return Row(
      mainAxisAlignment: this.message.out == 0
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        Container(
            margin: const EdgeInsets.only(
                top: Indents.small, bottom: Indents.small),
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: this.message.out == 0
                    ? BorderRadius.horizontal(right: Radius.circular(15))
                    : BorderRadius.horizontal(left: Radius.circular(15)),
                color: Colors.red[100]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              this.message.text.isEmpty
                  ? Container()
                  : Text(
                      this.message.text,
                      style: Fonts.h3,
                      maxLines: 50,
                      textAlign: TextAlign.left,
                    ),
              ...attachmentWidgets
            ])),

        this.withPhoto ? Container(
          width: 20, height: 20,
          
        ) : Offstage()
      ],
    );
  }

  void createAttachmentList() {
    var attachList = this.message.attachments;

    if (attachList.isEmpty) return;

    for (var attach in attachList) {
      if (attach is Sticker) {
        attachmentWidgets.add(StickerWidget(url: attach.images[1].url));
        continue;
      }

      if (attach is Audio) {
        attachmentWidgets.add(AudioWidget(title: 'audio', url: attach.url));
        continue;
      }
      if (attach is Photo) {
        attachmentWidgets.add(PhotoWidget(url: attach.sizes[0].url, photo: attach));
        continue;
      }
    }
  }
}
