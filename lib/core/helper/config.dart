import 'dart:convert';
import 'package:flutter/services.dart';

class Config
{
  Config._internal();
  static final _instance = Config._internal();

  factory Config() => _instance;

  final String configPath = 'config';
  final Map<String, dynamic> _config = {};

  static T get<T>(List<String> path, [T defaultValue]) => 
    Config._instance._get(path, defaultValue);

  Future<void> load([List<String> configFiles = const ['app']]) async 
  {
    for (final key in configFiles) 
    {
      try {
        final configString = await rootBundle.loadString('$configPath/$key.json');
        final configObject = json.decode(configString);

        if (configObject == null) {
          continue;
        }

        this._config[key] = configObject;
      }
      catch(_) {}
    }
  }

  T _get<T>(List<String> path, [T defaultValue])
  {
    if (path.isEmpty) return defaultValue;

    final valueKey = path.removeLast();
    Map<String, dynamic> config = this._config;

    for (final pathKey in path) {
      if (config is! Map) {
        return defaultValue;
      }

      config = config[pathKey];
    }

    final configValue = config[valueKey];
    return configValue is T ? configValue : defaultValue;
  }

  Map<String, dynamic> toJson() => this._config;

  @override
  String toString() => this._config.toString();
}