import 'package:bloc_test/app.dart';
import 'package:bloc_test/service_locator/inti_dependencies.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  runApp(
    App(),
  );
}
