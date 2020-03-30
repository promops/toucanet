import 'package:toucanet/core/http/http.dart';
import 'package:toucanet/core/config/config.dart';

abstract class VKRemote
{
  final Http http;
  final String accessToken;

  String baseUrl = Config.vk.api.baseUrl;
  String version = Config.vk.api.version;

  VKRemote([this.accessToken, int connectTimeout = 0]) : 
    this.http = Http(connectTimeout);

  Future<HttpResponse> call(String method, [Map<String, dynamic> parameters]) async
  {
    parameters = parameters ?? {};

    parameters.updateAll((_, value) 
    {
      if (value is num) return '$value';
      if (value is List) return value.join(',');
      return value;
    });

    if (this.accessToken != null) {
      parameters['access_token'] = this.accessToken;
    }
    
    return await this.http.post(
      this.baseUrl + 'method/$method', 
      body: {...?parameters, 'v': this.version}
    );
  }
}