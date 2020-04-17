part of 'vk_api_client.dart';

class VKApiRequest
{
  final VKApiClient client;

  VKApiRequest(this.client);

  Future<HttpResponse> execute(String method, [Map<String, dynamic> parameters]) async
  {
    parameters = parameters ?? {};

    parameters.updateAll((_, value) 
    {
      if (value is num) return '$value';
      if (value is List) return value.join(',');
      return value;
    });

    if (client.accessToken != null) {
      parameters['access_token'] = client.accessToken;
    }
    
    return await client.httpClient.post(
      client.baseUrl + 'method/$method', 
      body: {...?parameters, 'v': client.version}
    );
  }
}