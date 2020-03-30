abstract class HttpUtils
{
  static Map<String, String> explodeQueryString(String query)
  {
    if (query == null) return {};
     
    Map<String, String> parameters = {};
    
    query.split("&").forEach((keyValue) 
    {
      final keyValueArray = keyValue.split("=");
      if (keyValueArray.length == 2) parameters[keyValueArray[0]] = keyValueArray[1];
    });
    
    return parameters;
  }
}