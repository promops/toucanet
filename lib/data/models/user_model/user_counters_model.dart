class UserCountersModel {
  UserCountersModel({this.albums, this.friends, this.groups, this.photos});

  int albums;
  int friends;
  int groups;
  int photos;

  factory UserCountersModel.fromJson(Map<String, dynamic> json) {
    return UserCountersModel(
        albums: json['albums'],
        friends: json['friends'],
        groups: json['groups'],
        photos: json['photos']);
  }
  @override
  String toString() => '$albums $friends $groups $photos';
}
