part of './../config.dart';

// enum VKLanguage { RU, UK, BE, EN, ES, FI, DE, IT }

class VKConfigModel 
{
  final _VKApiConfigModel api;
  final _VKAuthConfigModel auth;

  VKConfigModel._(this.api, this.auth);

  factory VKConfigModel.fromJson(Map<String, dynamic> json) 
  {
    if (json == null) throw ArgumentError;

    return VKConfigModel._(
      _VKApiConfigModel.fromJson(json['api']),
      _VKAuthConfigModel.fromJson(json['auth'])
    );
  }
}


class _VKAuthConfigModel
{
  final int clientId;
  final String oauthUrl;
  final List<String> permissions;

  _VKAuthConfigModel._(this.clientId, this.oauthUrl, this.permissions);

  factory _VKAuthConfigModel.fromJson(Map<String, dynamic> json) 
  {
    if (json == null) throw ArgumentError;

    return _VKAuthConfigModel._(
      json['clientId'],
      json['oauthUrl'],
      json['permissions'].cast<String>()
    );
  }
}


class _VKApiConfigModel
{
  final int testMode;
  final String baseUrl;
  final String version;
  final String language;

  _VKApiConfigModel._(this.baseUrl, this.testMode, this.version, this.language);

  factory _VKApiConfigModel.fromJson(Map<String, dynamic> json) 
  {
    if (json == null) throw ArgumentError;

    return _VKApiConfigModel._(
      json['baseUrl'],
      json['testMode'],
      json['version'],
      json['language']
    );
  }
}