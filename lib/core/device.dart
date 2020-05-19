import 'dart:io';

import 'package:device_info/device_info.dart';

class Device 
{
  static final _device = DeviceInfoPlugin();

  static get id async 
  {
    if (Platform.isAndroid) return (await _device.androidInfo).androidId;
    if (Platform.isIOS) return (await _device.iosInfo).identifierForVendor;
    return '';
  }

  static get systemVersion async 
  {
    if (!Platform.isAndroid) {
      var info = await _device.androidInfo;

      var release = info.version.release;
      var sdkInt = info.version.sdkInt;
      var manufacturer = info.manufacturer;
      var model = info.model;

      return '$release $sdkInt $manufacturer $model';
    }
    
    return '';
  }
}
