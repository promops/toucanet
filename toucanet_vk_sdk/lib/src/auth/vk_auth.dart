import '../enums/vk_enums.dart';
import '../exceptions/vk_api_exception_mapper.dart';

import '../vk_client.dart';
import 'vk_auth_helpers.dart';

class VKAuth {
  final VKClient vkClient;
  static const defaultHost = 'https://oauth.vk.com/';

  const VKAuth(this.vkClient);

  String getAuthorizeUrl({
    String state = '',
    bool revoke = false,
    required List<String> scope,
    List<int> groupIds = const [],
    String oAuthUrl = defaultHost,
    String redirectUri = '$defaultHost/blank.html',
    VKAuthDisplay displayType = VKAuthDisplay.mobile,
    VKAuthResponseType responseType = VKAuthResponseType.token,
  }) {
    const displayTypes = ['popup', 'page', 'mobile'];
    const responseTypes = ['code', 'token'];

    var url = '${oAuthUrl}authorize'
        '?v=${vkClient.version}'
        '&scope=${scope.join(',')}'
        '&client_id=${vkClient.clientId}'
        '&redirect_uri=${redirectUri}blank.html'
        '&display=${displayTypes[displayType.index]}'
        '&response_type=${responseTypes[responseType.index]}';

    if (revoke) url += '&revoke=1';
    if (state.isNotEmpty) url += '&state=${state}';
    if (groupIds.isNotEmpty) url += '&group_ids=${groupIds.join(',')}';

    return url;
  }

  String getAccessToken() {
    return '';
  }

  Map<String, String> parseAuthUrl(String uri) {
    final query = uri.substring(uri.indexOf('#') + 1);
    final parameters = VKAuthHelpers.explodeQuery(query);

    if (parameters.containsKey('error')) {
      throw ExceptionMapper.mapErrorResponseToException(5, 'Auth denied.');
    }

    return parameters;
  }
}
