import 'dart:convert';

abstract class JsonSerializer
{
  Map<String, dynamic> toJson();
}

class JsonSyntaxException implements Exception {}

typedef S JsonDeserializer<S>(Map<String, dynamic> json);

abstract class Json
{
  static String encode<T extends JsonSerializer>(T object) 
  {
    return json.encode(object.toJson());
  }

  static T decode<T>(String jsonMap, JsonDeserializer<T> jsonDeserializer)
  {
    try {
      return jsonDeserializer(json.decode(jsonMap));
    }
    catch(_) { 
      throw JsonSyntaxException(); 
    }
  }
}