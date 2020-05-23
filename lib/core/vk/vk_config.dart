part of 'vk.dart';

class VKConfig
{
  final _VKConfigApi api;
  final _VKConfigAuth auth;
  final _VKConfigLongPoll longpoll;

  VKConfig(this.api, this.auth, this.longpoll);

  factory VKConfig.fromJson(Map<String, dynamic> json) =>
    VKConfig(
      _VKConfigApi.fromJson(json['api']),
      _VKConfigAuth.fromJson(json['auth']),
      _VKConfigLongPoll.fromJson(json['longpoll'])
    );
}

class _VKConfigApi
{
  final int testMode;
  final double version;
  final String baseUrl;
  final String language;

  _VKConfigApi(this.testMode, this.version, this.baseUrl, this.language);

  factory _VKConfigApi.fromJson(Map<String, dynamic> json) =>
     _VKConfigApi(json['testMode'], json['version'], json['baseUrl'], json['language']);
}

class _VKConfigAuth
{
  final int clientId;
  final String oAuthUrl;
  final List permissions;

  _VKConfigAuth(this.clientId, this.oAuthUrl, this.permissions);

  factory _VKConfigAuth.fromJson(Map<String, dynamic> json) =>
     _VKConfigAuth(json['clientId'], json['oauthUrl'], json['permissions']);
}

class _VKConfigLongPoll
{
  final int onlines;
  final int version;
  final List fields;

  _VKConfigLongPoll(this.onlines, this.version, this.fields);

  factory _VKConfigLongPoll.fromJson(Map<String, dynamic> json) =>
     _VKConfigLongPoll(json['onlines'], json['version'], json['fields']);
}