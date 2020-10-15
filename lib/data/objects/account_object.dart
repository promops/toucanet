import '../../domain/base/model_mapper.dart';
import '../../domain/base/json_serializer.dart';
import '../../domain/models/account_model.dart';

class AccountObject implements JsonSerializer, ModelMapper<AccountModel> {
  final int id;
  final int created;
  final String token;
  final int expiresIn;

  AccountObject(this.id, this.token, this.expiresIn, [int created])
      : assert(id != null),
        assert(token != null),
        assert(expiresIn != null),
        created = created ?? DateTime.now().millisecondsSinceEpoch;

  factory AccountObject.fromJson(Map<String, dynamic> json) {
    if (json == null) throw ArgumentError();

    return AccountObject(
      json['id'] as int,
      json['token'] as String,
      json['expiresIn'] as int,
      json['created'] as int,
    );
  }

  factory AccountObject.fromModel(AccountModel account) {
    return AccountObject(
      account.id,
      account.token,
      account.expiresIn,
      account.created,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'token': token,
      'created': created,
      'expiresIn': expiresIn,
    }..removeWhere((_, dynamic value) => value == null);
  }

  @override
  AccountModel toModel() => AccountModel(id, token, created, expiresIn);
}
