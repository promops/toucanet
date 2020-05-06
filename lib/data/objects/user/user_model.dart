import 'package:equatable/equatable.dart';

import 'user_counters_model.dart';

class UserModel extends Equatable{
  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.status,
      this.deactivated,
      this.isClosed,
      this.sex,
      this.photo200orig,
      this.photo50,
      this.photo100,
      this.userCounters, this.online});

  final int id;

  final String firstName;
  final String lastName;
  final String status;

  final String deactivated;
  final bool isClosed;
  final int sex;

  //Аватарки
  final String photo200orig;
  final String photo50;
  final String photo100;

  final int online;

  UserCountersModel userCounters;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstName: json['first_name'] ?? '',
        lastName: json['last_name'],
        status: json['status'],
        isClosed: json['is_closed'],
        sex: json['sex'],
        photo200orig: json['photo_200_orig'],
        photo50: json['photo_50'],
        photo100: json['photo_100'],
        online : json['online'],
        userCounters: UserCountersModel.fromJson(json['counters']));
  }

  

  @override
  String toString() => '$firstName $lastName';

  @override
  List<Object> get props => [id];
}
