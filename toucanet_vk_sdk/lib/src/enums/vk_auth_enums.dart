part of 'vk_enums.dart';

/// Authorization page appearance.
enum VKAuthDisplay {
  /// A pop-up window.
  popup,

  /// Authorization form in a separate window.
  page,

  /// Authorization for mobile devices (uses no Javascript).
  mobile,
}

/// Response type to receive.
enum VKAuthResponseType {
  /// Code Flow authorization.
  code,

  /// Implicit Flow authorization.
  token,
}

/// Access permissions for community.
abstract class VKAuthCommunityScope {
  /// Access to stories.
  static const stories = 'stories';

  /// Access to photos.
  static const photos = 'photos';

  /// Access to messages.
  static const messages = 'messages';

  /// Access to docs.
  static const docs = 'docs';

  /// Access to community management.
  static const offline = 'manage';
}

/// Access permissions for user.
abstract class VKAuthUserScope {
  /// User allowed to send notifications to him/her (for Flash/iFrame apps).
  static const notify = 'notify';

  /// Access to friends.
  static const friends = 'friends';

  /// Access to photos.
  static const photos = 'photos';

  /// Access to audio.
  static const audio = 'audio';

  /// Access to video.
  static const video = 'video';

  /// Access to stories.
  static const stories = 'stories';

  /// Access to wiki pages.
  static const pages = 'pages';

  /// Addition of link to the application in the left menu.
  static const menu = '+256';

  /// Access to user status.
  static const status = 'status';

  /// Access to notes.
  static const notes = 'notes';

  /// Access to advanced methods for messaging.
  static const messages = 'messages';

  /// Access to standard and advanced methods for the wall.
  static const wall = 'wall';

  /// Access to advanced methods for Ads API (https://vk.com/dev/ads).
  static const ads = 'ads';

  /// Access to API at any time (you will receive expires_in = 0 in this case).
  static const offline = 'offline';

  /// Access to docs.
  static const docs = 'docs';

  /// Access to user communities.
  static const groups = 'groups';

  /// Access to notifications about answers to the user.
  static const notifications = 'notifications';

  /// Access to statistics of user groups and applications where he/she
  /// is an administrator.
  static const stats = 'stats';

  /// Access to user email.
  static const email = 'email';

  /// Access to market.
  static const market = 'market';

  /// Possibility to make API requests without HTTPS.
  static const phone = 'nohttps';
}
