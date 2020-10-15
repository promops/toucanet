/// Authorization page appearance.
abstract class VKAuthDisplay {
  /// Authorization form in a separate window.
  static const page = 'page';

  /// A pop-up window.
  static const popup = 'popup';

  /// Authorization for mobile devices (uses no Javascript).
  static const mobile = 'mobile';
}
