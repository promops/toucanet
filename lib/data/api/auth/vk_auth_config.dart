class VKConfigAuth {
  final int clientId;
  final double version;
  final String oAuthUrl;

  /// List of permissions.
  final List<String> permissions;

  VKConfigAuth({this.clientId, this.oAuthUrl, this.version, this.permissions});
}
