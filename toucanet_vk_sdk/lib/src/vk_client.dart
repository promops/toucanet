import 'auth/vk_auth.dart';

class VKClient {
  final int clientId;
  final double version;
  final String? clientSecret;

  late final VKAuth auth;

  VKClient({required this.clientId, this.clientSecret, this.version = 5.103}) {
    auth = VKAuth(this);
  }
}
