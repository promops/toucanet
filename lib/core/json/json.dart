import 'dart:convert';

part 'json_serializer.dart';
part 'json_syntax_exception.dart';

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