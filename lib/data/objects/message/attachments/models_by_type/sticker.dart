import '../attachment.dart';

class Sticker extends Attachment {
  Sticker({this.productId, this.stickerId, this.images});
  final int productId;
  final int stickerId;
  final List<StickerImage> images;

  factory Sticker.fromJson(Map<String, dynamic> json) {
    List<StickerImage> images = [];
    json['images'].forEach((image) => images.add(StickerImage.fromJson(image)));
    return Sticker(
      productId: json['productId'],
      stickerId: json['stickerId'],
      images: images
    );
  }
}

class StickerImage {
  StickerImage({this.url, this.width, this.height});
  final String url;
  final int width;
  final int height;

  factory StickerImage.fromJson(Map<String, dynamic> json) =>
      StickerImage(url: json['url'], width: json['width'], height: json['height']);
}
