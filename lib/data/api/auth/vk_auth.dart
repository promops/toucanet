import './../helpers/strings.dart';
import './../exceptions/vk_api_exception_mapper.dart';

class VKAuth {
  // final VKConfig config;

  // VKAuth(this.config);

  // String get oAuthUrl =>
  //     '${config.auth.oAuthUrl}authorize' +
  //     '?response_type=token' +
  //     '&v=${config.api.version}' +
  //     '&client_id=${config.auth.clientId}' +
  //     '&scope=${config.auth.permissions.join(',')}' +
  //     '&redirect_uri=${config.auth.oAuthUrl}blank.html';

  Map<String, String> parseAuthUrl(String uri) {
    final query = uri.substring(uri.indexOf('#') + 1);
    final parameters = VKStrings.explodeQuery(query);

    if (parameters.containsKey('error')) {
      throw ExceptionMapper.mapErrorResponseToException(5, 'User denied');
    }

    return parameters;
  }
}
