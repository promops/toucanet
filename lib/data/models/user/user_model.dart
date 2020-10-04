import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

//flutter packages pub run build_runner build
//--delete-conflicting-outputs

@JsonSerializable(explicitToJson: true)
class UserModel {
  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.deactivated,
      this.isClosed,
      this.canAccessClosed});

  // Идентификатор пользователя.
  final int id;
  //Имя
  @JsonKey(name: 'first_name')
  final String firstName;
  //Фамилия
  @JsonKey(name: 'last_name')
  final String lastName;
  //Поле возвращается, если страница пользователя удалена или заблокирована, содержит значение deleted или banned. В этом случае опциональные поля не возвращаются.
  final String deactivated;
  //Cкрыт ли профиль пользователя настройками приватности.
  @JsonKey(name: 'is_closed')
  final String isClosed;
  //Может ли текущий пользователь видеть профиль при is_closed = 1 (например, он есть в друзьях).
  @JsonKey(name: 'can_access_closed')
  final bool canAccessClosed;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
