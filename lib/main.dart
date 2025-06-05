import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import 'core/config/config.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Parse().initialize(Env.appId, Env.parseUrl, clientKey: Env.clientKey, debug: true);
  } catch (e) {
    debugPrint('Erro ao inicializar Parse: $e');
  }

  runApp(const MyApp());
}
