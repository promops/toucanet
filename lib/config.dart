enum Flavor { MOCK, REMOTE }

class Config 
{
   static const app = _AppConfig;
   static const auth = _AuthConfig;
}

class _AppConfig
{
  static const debug = true;
  static const flavor = Flavor.REMOTE;
}

class _AuthConfig
{
  static const version = '5.103';
  static const clientId = 7378583;
  static const redirectUrl = 'https://oauth.vk.com/blank.html';
}
