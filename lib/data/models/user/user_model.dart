import 'dart:convert';

import 'package:hive/hive.dart';
import '../db_key.dart';

part 'user_model.g.dart';

@HiveType(typeId: 5)
class UserModel extends DbKey {
  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.deactivated,
      this.isClosed,
      this.canAccessClosed});

  // Идентификатор пользователя.
  @HiveField(0)
  final int id;
  //Имя
  @HiveField(1)
  final String firstName;
  //Фамилия
  @HiveField(2)
  final String lastName;
  //Поле возвращается, если страница пользователя удалена или заблокирована, содержит значение deleted или banned. В этом случае опциональные поля не возвращаются.
  @HiveField(3)
  final String deactivated;
  //Cкрыт ли профиль пользователя настройками приватности.
  @HiveField(4)
  final String isClosed;

  //Может ли текущий пользователь видеть профиль при is_closed = 1 (например, он есть в друзьях).
  @HiveField(5)
  final bool canAccessClosed;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'deactivated': deactivated,
      'is_closed': isClosed,
      'can_access_closed': canAccessClosed,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      id: map['id'] as int,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      deactivated: map['deactivated'] as String,
      isClosed: map['is_closed'] as String,
      canAccessClosed: map['can_access_closed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String key() => '$id';
}
