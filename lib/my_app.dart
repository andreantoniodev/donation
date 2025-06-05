import 'package:flutter/material.dart';

import 'core/core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue.shade800, foregroundColor: Colors.white),
        scaffoldBackgroundColor: const Color.fromARGB(255, 241, 241, 241),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade800,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}
