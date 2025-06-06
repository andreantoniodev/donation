import 'package:flutter/material.dart';

import 'core/config/config.dart';
import 'core/config/parse_config.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await ParseConfig.initialize();
  } catch (e) {
    debugPrint('Erro ao inicializar Parse: $e');
  }

  runApp(const MyApp());
}
