class AccountException implements Exception {
  final String message;

  AccountException([this.message]);

  @override
  String toString() => message ?? '';
}
