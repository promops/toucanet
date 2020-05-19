part of 'vk_api.dart';

class VKApiClient
{
  final String baseUrl;
  final double version;
  final String accessToken;

  VKApiClient(this.accessToken, config) :
    baseUrl = config['baseUrl'] ?? '',
    version = config['version'] ?? 5.103;

  Future<Map<String, dynamic>> method(
    String name, [Map<String, dynamic> parameters]) async
  {
    parameters = {...?parameters, 'v': version};
    final response = await this.get(baseUrl + 'method/$name', parameters);

    if (response['response'] is Map) {
      return response['response'];
    }

    if (response['error'] is! Map) {
      throw ExceptionMapper.mapErrorResponseToException(0, '');
    }

    final errorCode = response['error']['error_code'];
    final errorMessage = response['error']['error_msg'];
    throw ExceptionMapper.mapErrorResponseToException(errorCode, errorMessage);
  }

  Future<Map<String, dynamic>> get(String url, [Map<String, dynamic> parameters]) async
  {
    parameters ??= {};

    parameters.updateAll((_, value) 
    {
      if (value is num) return '$value';
      if (value is List) return value.join(',');
      return '';
    });

    parameters = parameters.cast<String, String>();
    
    if (this.accessToken != null) {
      parameters['access_token'] = this.accessToken;
    }
    
    final response = await Http().post(url, body: parameters);
    if (response.body is! Map) return {};
    
    return response.body;
  }
}