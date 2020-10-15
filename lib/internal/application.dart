import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../settings.dart';

import 'scopes/initialization.dart';
import 'scopes/authentication.dart';

// import 'view/screens/auth/auth_screen.dart';
// import 'view/screens/home/home_screen.dart';
import '../presentation/screens/splash/splash_screen.dart';

class Toucanet extends StatelessWidget {
  const Toucanet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: AppThemes.main,
      //
      title: Settings.appTitle,
      //
      // routes: Routes.getRoutes(),
      //
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      //
      home: InitializationScope(
        app: AuthenticationScope(
          auth: Container(),
          home: Container(),
        ),
        initial: const SplashScreen(),
      ),
      //
      debugShowCheckedModeBanner: Settings.isProduction,
    );
  }
}
