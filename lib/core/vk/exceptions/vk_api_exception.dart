abstract class VKApiException implements Exception 
{
  final int code;
  final String message;
  final String description;

  VKApiException(this.code, this.description, [this.message = '']);

  @override
  String toString() => '$description($code): $message';
}