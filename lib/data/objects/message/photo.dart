class Photo {
  Photo({this.photo50, this.photo100, this.photo200});

  final String photo50;

  final String photo100;

  final String photo200;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
      photo50: json['photo_50'],
      photo100: json['photo_100'],
      photo200: json['photo_200']);
}
