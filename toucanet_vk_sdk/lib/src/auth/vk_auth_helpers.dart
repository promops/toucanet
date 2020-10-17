abstract class VKAuthHelpers {
  static Map<String, String> explodeQuery(String query) {
    final parameters = <String, String>{};

    query.split('&').forEach((keyValue) {
      final keyValuePair = keyValue.split('=');

      if (keyValuePair.length == 2) {
        parameters[keyValuePair[0]] = keyValuePair[1];
      }
    });

    return parameters;
  }
}
