class Settings {
  static const appTitle = 'Toucanet';
  static const isProduction = bool.fromEnvironment('dart.vm.product');

  static const vkClientId = int.fromEnvironment('clientId', defaultValue: 0);

  static const vkApiVersion =
      String.fromEnvironment('version', defaultValue: '5.103');
}
