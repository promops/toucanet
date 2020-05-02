import 'package:flutter/material.dart';
import 'package:toucanet/app/pages/messages/dialog_page/attachment_widgets/audio_widget.dart';
import 'package:toucanet/app/styles/fonts.dart';
import 'package:toucanet/app/styles/indents.dart';
import 'package:toucanet/data/objects/message/attachments/models_by_type/audio.dart';
import 'package:toucanet/data/objects/message/attachments/models_by_type/sticker.dart';
import 'package:toucanet/data/objects/message/message.dart';

import 'attachment_widgets/sticker_widget.dart';

class Wrapper extends StatelessWidget {
  Wrapper({this.message});

  Message message;

  List<Widget> children;

  List<Widget> attachmentWidgets = [];

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
            ]))
      ],
    );
  }

  void createAttachmentList() {
    var attachList = this.message.attachments;

    if (attachList.isEmpty) return;

    for (var attach in attachList) {
      if (attach is Sticker)
        attachmentWidgets.add(StickerWidget(url: attach.images[1].url));

      if (attach is Audio)
        attachmentWidgets.add(AudioWidget(title: 'audio', url: attach.url));
    }
  }
}
