class UserCountersModel {
  UserCountersModel({this.albums, this.friends, this.groups, this.photos});

  int albums;
  int friends;
  int groups;
  int photos;

  factory UserCountersModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return UserCountersModel.empty();

    return UserCountersModel(
      albums: json.containsKey('albums') ? json['albums'] : 0,
      friends: json.containsKey('friends') ? json['albums'] : 0,
      groups: json.containsKey('groups') ? json['albums'] : 0,
      photos: json.containsKey('photos') ? json['albums'] : 0,
    );
  }

  factory UserCountersModel.empty() =>
      UserCountersModel(albums: 0, friends: 0, groups: 0, photos: 0);

  @override
  String toString() => '$albums $friends $groups $photos';
}
