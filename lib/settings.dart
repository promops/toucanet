class Settings {
  static const appTitle = 'Toucanet';

  static const serverPort =
      String.fromEnvironment('port', defaultValue: '3333');

  static const serverHost =
      String.fromEnvironment('host', defaultValue: '127.0.0.1');

  static const isProduction = bool.fromEnvironment('dart.vm.product');
}
