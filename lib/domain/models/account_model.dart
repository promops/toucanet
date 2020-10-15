class AccountModel {
  final int id;
  final int created;
  final String token;
  final int expiresIn;

  AccountModel(this.id, this.token, this.created, this.expiresIn)
      : assert(id != null),
        assert(token != null),
        assert(created != null),
        assert(expiresIn != null);

  bool get isAuth =>
      token.isNotEmpty &&
      (expiresIn == 0 ||
          expiresIn > 0 &&
              created + expiresIn * 1000 <=
                  DateTime.now().millisecondsSinceEpoch);

  @override
  String toString() =>
      'Account(id: $id, created: $created, token: $token, $expiresIn)';
}
