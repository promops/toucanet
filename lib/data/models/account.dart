class AccountModel 
{
  int id;
  int created;
  String token;
  int expiresIn;

  AccountModel(this.id, this.token, this.expiresIn, [this.created]) : 
    assert(token != null),
    assert(token.length > 0)
  {
    this.created = created ?? DateTime.now().millisecondsSinceEpoch;
  }

  AccountModel.clone(AccountModel account) : 
    this(account.id, account.token, account.expiresIn);

  AccountModel copyWith({int id, String token, int created, int expiresIn}) => AccountModel(
      id ?? this.id,
      token ?? this.token,
      expiresIn ?? this.expiresIn,
      created ?? this.created
  );

  Map<String, dynamic> toJson() =>
  {
    'id': id ?? 0,
    'token': token ?? '',
    'created': created ?? 0,
    'expiresIn': expiresIn ?? 0
  };

  factory AccountModel.fromJson(Map<String, dynamic> json) 
  {
    if (json == null) throw ArgumentError();

    return AccountModel(
      json['id'], 
      json['token'], 
      json['expiresIn'], 
      json['created']
    );
  }

  @override
  String toString() => this.toJson().toString();

  bool get isValid =>
    expiresIn <= 0 || created + expiresIn * 1000 > DateTime.now().millisecondsSinceEpoch;
}
