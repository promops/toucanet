import 'dart:async';

import 'package:flutter/material.dart';

import 'di.dart';
import 'internal/application.dart';

void main() {
  runZonedGuarded<void>(
    _run,
    (error, stackTrace) => print(error),
  );
}

Future<void> _run() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Injector(app: Toucanet()));
}
