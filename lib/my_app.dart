import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import 'core/core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp.router(routerConfig: AppRoutes.router, theme: AppTheme.themeData),
    );
  }
}
