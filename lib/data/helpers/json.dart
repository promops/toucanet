import 'dart:convert';

import '../../domain/base/json_serializer.dart';

/// Thrown when JSON cannot be processing.
class JsonProcessingException implements Exception {}

/// Used by [Json.decode].
typedef JsonDeserializer<T> = T Function(dynamic json);

/// JSON helper.
abstract class Json {
  static String encode<T extends JsonSerializer>(T object) {
    try {
      return json.encode(object.toJson());
    } on Exception catch (_) {
      throw JsonProcessingException();
    }
  }

  static T decode<T>(String jsonString, JsonDeserializer<T> jsonDeserializer) {
    try {
      final dynamic data = json.decode(jsonString);
      return jsonDeserializer(data);
    } on Exception catch (_) {
      throw JsonProcessingException();
    }
  }
}
