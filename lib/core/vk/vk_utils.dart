part of 'vk.dart';

abstract class VKUtils
{
  static Map<String, String> explodeQueryString(String query)
  {
    final parameters = <String, String>{};

    query?.split("&")?.forEach((keyValue) 
    {
      final keyValuePair = keyValue.split("=");
      if (keyValuePair.length == 2) parameters[keyValuePair[0]] = keyValuePair[1];
    });
    
    return parameters;
  }
}
