import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';


import 'package:toucanet/core/vk/vk.dart';
import 'package:toucanet/core/device.dart';

class VKAccountRemote 
{
  final VK vk;

  VKAccountRemote(this.vk);

  Future<void> registerDevice() async {
    String deviceId = await Device.id;
    String pushToken = await FirebaseMessaging().getToken();

    final result = await this.vk.api.method('account.registerDevice', {
      'token': pushToken,
      'device_id': deviceId,
      'system_version': "9.1.2",
      'device_year': 2017,
      'device_model': 'Google pixel 2',
      'settings': json.encode({"msg": "on", "chat": "on", "friend": "on"})
    });

    print(result);
  }

  Future<void> getPushSettings() async {
    String deviceId = await Device.id;

    final result = await this.vk.api.method('account.getPushSettings', {
      'device_id': deviceId,
    });

    print(result);
  }

  Future<void> setPushSettings() async {
    String deviceId = await Device.id;
    String pushToken = await FirebaseMessaging().getToken();

    final result = await this.vk.api.method('account.setPushSettings', {
      // 'token': pushToken,
      'device_id': deviceId,
      'key': pushToken,
      'settings': json.encode({"msg": "on", "chat": "on", "friend": "off"})
    });

    print(result);
  }

  Future<void> unregisterDevice() async {
    String deviceId = await Device.id;

    final result = await this.vk.api.method('account.unregisterDevice', {
      'device_id': deviceId,
    });

    print(result);
  }
}
