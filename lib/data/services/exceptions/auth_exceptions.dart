abstract class AuthException implements Exception 
{
  final String message;

  AuthException({this.message = ''});

  @override
  String toString() => message;
}

class AuthAccessDeniedException implements AuthException 
{
  final String message;

  AuthAccessDeniedException(this.message);

  @override
  String toString() => message;
}