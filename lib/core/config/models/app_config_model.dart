part of './../config.dart';

// enum Flavor { MOCK, REMOTE }

class AppConfigModel 
{
  final bool debug;

  AppConfigModel._(this.debug);

  factory AppConfigModel.fromJson(Map<String, dynamic> json) 
  {
    if (json == null) throw ArgumentError;
    return AppConfigModel._(json['debug']);
  }
}
