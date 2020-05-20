part of 'vk.dart';

class VKAuth
{
  final VKConfig config;

  VKAuth(this.config);

  String get oAuthUrl =>
    '${config.auth.oAuthUrl}authorize' +
    '?response_type=token' +
    '&v=${config.api.version}' +
    '&client_id=${config.auth.clientId}' +
    '&scope=${config.auth.permissions.join(',')}' +
    '&redirect_uri=${config.auth.oAuthUrl}blank.html';

  Map<String, String> parseAuthUrl(String uri)
  {
    final queryString = uri.substring(uri.indexOf("#") + 1);
    final parameters = VKUtils.explodeQueryString(queryString);

    if (parameters.containsKey('error')) {
      throw ExceptionMapper.mapErrorResponseToException(5, 'User denied');
    }
    
    return parameters;
  }
}