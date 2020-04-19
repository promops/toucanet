import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfo {

  static get deviceId async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      var info = await deviceInfo.androidInfo;
      return info.androidId;
    }

    if (Platform.isIOS) {
      var info = await deviceInfo.iosInfo;
      return info.identifierForVendor;
    }

    return '';
  }

  static get systemVersion async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      var info = await deviceInfo.androidInfo;

      var release = info.version.release;
      var sdkInt = info.version.sdkInt;
      var manufacturer = info.manufacturer;
      var model = info.model;

      return '$release $sdkInt $manufacturer $model';
    }

    return '';
  }
}
