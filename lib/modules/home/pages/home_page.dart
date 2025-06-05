import 'package:flutter/material.dart';

import '../components/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IEADPE Agreste'), centerTitle: true),
      drawer: const AppDrawer(),
      body: Center(child: Text('Home')),
    );
  }
}
