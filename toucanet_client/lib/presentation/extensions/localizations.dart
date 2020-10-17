import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

/// Extends the `BuildContext` class with the ability
/// to perform a lookup the localizations.
extension LocalizationsExtension on BuildContext {
  /// Performs a lookup using the `BuildContext` to obtain
  /// the nearest localizations.
  ///
  /// Calling this getter is equivalent to calling:
  ///
  /// ```dart
  /// AppLocalizations.of(context)
  /// ```
  AppLocalizations get l10n => AppLocalizations.of(this);
}
