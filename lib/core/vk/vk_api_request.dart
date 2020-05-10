part of 'vk_api_client.dart';

class VKApiRequest
{
  final Http client;
  final String accessToken;

  final String baseUrl;
  final double version;

  VKApiRequest(this.client, this.accessToken, config) :
    baseUrl = config['baseUrl'] ?? '',
    version = config['version'] ?? 5.103;

  Future<HttpResponse> execute(String method, [Map<String, dynamic> parameters]) async
  {
    parameters ??= {};

    parameters.updateAll((_, value) 
    {
      if (value is num) return '$value';
      if (value is List) return value.join(',');
      return value;
    });

    if (this.accessToken != null) {
      parameters['access_token'] = this.accessToken;
    }
    
    return await this.client.post(
      baseUrl + 'method/$method', 
      body: {...?parameters, 'v': '$version'}
    );
  }
}