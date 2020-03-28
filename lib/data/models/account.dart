import 'package:flutter/foundation.dart';

class AccountModel 
{
  int id;
  String name;
  String token;

  AccountModel({@required this.id, @required this.token}) : 
    assert(token != null),
    assert(token.length > 0);

  AccountModel.clone(AccountModel account) : 
    this(id: account.id, token: account.token);

  Map<String, dynamic> toJson() =>
  {
    'id': id ?? '',
    'token': token ?? ''
  };

  factory AccountModel.fromJson(Map<String, dynamic> json) 
  {
    if (json == null) throw ArgumentError;
    
    return AccountModel(
      id: json['id'],
      token: json ['token']
    );
  }

  @override
  String toString() => this.toJson().toString();
}
