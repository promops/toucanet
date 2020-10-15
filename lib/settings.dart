class Settings {
  static const appTitle = 'Toucanet';
  static const isProduction = bool.fromEnvironment('dart.vm.product');

  static const apiClientId =
      String.fromEnvironment('clientId', defaultValue: '');

  static const apiVersion =
      String.fromEnvironment('version', defaultValue: '5.103');

  static const apiBaseUrl =
      String.fromEnvironment('baseUrl', defaultValue: 'https://api.vk.com/');

  static const oAuthUrl =
      String.fromEnvironment('oAuthUrl', defaultValue: 'https://oauth.vk.com/');
}
