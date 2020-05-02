import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../core/helper/device_info.dart';
import 'vk_remote.dart';

class VKAccountRemote extends VKRemote {
  VKAccountRemote(String accessToken) : super(accessToken);

  Future<void> registerDevice() async {
    String deviceId = await DeviceInfo.deviceId;
    String pushToken = await FirebaseMessaging().getToken();

    final result = await this.call('account.registerDevice', {
      'token': pushToken,
      'device_id': deviceId,
      'system_version': "9.1.2",
      'device_year': 2017,
      'device_model': 'Google pixel 2',
      'settings': json.encode({"msg": "on", "chat": "on", "friend": "on"})
    });

    print(result.body['response']);
  }

  Future<void> getPushSettings() async {
    String deviceId = await DeviceInfo.deviceId;

    final result = await this.call('account.getPushSettings', {
      'device_id': deviceId,
    });

    print(result.body['response']);
  }

  Future<void> setPushSettings() async {
    String deviceId = await DeviceInfo.deviceId;
    String pushToken = await FirebaseMessaging().getToken();

    final result = await this.call('account.setPushSettings', {
      // 'token': pushToken,
      'device_id': deviceId,
      'key': pushToken,
      'settings': json.encode({"msg": "on", "chat": "on", "friend": "off"})
    });

    print(result.body['response']);
  }

  Future<void> unregisterDevice() async {
    String deviceId = await DeviceInfo.deviceId;

    final result = await this.call('account.unregisterDevice', {
      'device_id': deviceId,
    });

    print(result.body['response']);
  }
}
