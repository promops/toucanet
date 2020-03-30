import 'dart:convert';
import 'package:flutter/services.dart';

part 'models/vk_config_model.dart';
part 'models/app_config_model.dart';

abstract class Config
{
  static VKConfigModel _vkConfig;
  static AppConfigModel _appConfig;

  static VKConfigModel get vk => _vkConfig;
  static AppConfigModel get app => _appConfig;

  static bool get isProduction => bool.fromEnvironment('dart.vm.product');

  static Future<void> load() async 
  {
    String configString = await rootBundle.loadString('config/vk.json');
    Config._vkConfig = VKConfigModel.fromJson(json.decode(configString));

    configString = await rootBundle.loadString('config/app.json');
    Config._appConfig = AppConfigModel.fromJson(json.decode(configString));
  }
}