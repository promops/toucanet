import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:device_info/device_info.dart';

class Device 
{
  static final _device = DeviceInfoPlugin();

  static get id async
  {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android: 
        return (await _device.androidInfo).androidId;
      case TargetPlatform.iOS: 
        return (await _device.iosInfo).identifierForVendor;
      default:
        return '';
    }
  }

  static get system async
  {
    if (!Platform.isAndroid) return '';

    var info = await _device.androidInfo;

    var model = info.model;
    var sdkInt = info.version.sdkInt;
    var release = info.version.release;
    var manufacturer = info.manufacturer;

    return '$release $sdkInt $manufacturer $model';
  }
}
