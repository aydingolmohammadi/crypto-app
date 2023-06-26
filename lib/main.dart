import 'package:crypto_stats/app/app.dart';
import 'package:crypto_stats/locator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependency();
  runApp(
    const App(),
  );
}
