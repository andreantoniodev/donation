import 'package:flutter/material.dart';

import 'core/config/parse_config.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ParseConfig.initialize();

  runApp(const MyApp());
}
