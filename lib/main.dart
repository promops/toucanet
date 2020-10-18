import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:toucanet_vk_sdk/toucanet_vk_sdk.dart';

import 'di.dart';
import 'settings.dart';

import 'internal/application.dart';

void main() {
  runZonedGuarded<void>(
    _run,
    (error, stackTrace) => print(error),
  );
}

Future<void> _run() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Injector(
    app: const Toucanet(),
    client: VKClient(clientId: Settings.vkClientId),
  ));
}
