import 'package:flutter/material.dart';

import 'core/core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: AppRoutes.router, theme: AppTheme.themeData);
  }
}
