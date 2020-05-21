part of 'vk.dart';

class VKApi
{
  final VKConfig config;
  final String accessToken;

  VKApi(this.accessToken, this.config);

  Future<dynamic> method(
    String name, [Map<String, dynamic> parameters]) async
  {
    parameters = {...?parameters, 'v': config.api.version};
    final response = await this.request(config.api.baseUrl + 'method/$name', parameters);

    if (response['response'] != null) {
      return response['response'];
    }

    if (response['error'] is! Map) {
      throw ExceptionMapper.mapErrorResponseToException(0, '$response');
    }

    final errorCode = response['error']['error_code'];
    final errorMessage = response['error']['error_msg'];
    throw ExceptionMapper.mapErrorResponseToException(errorCode, errorMessage);
  }

  Future<Map> request(String url, [Map<String, dynamic> parameters]) async
  {
    parameters ??= {};

    parameters.updateAll((_, value) 
    {
      if (value is List) return value.join(',');
      return '$value';
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