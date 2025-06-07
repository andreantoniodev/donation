import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import '../components/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IEADPE Agreste'), centerTitle: true),
      drawer: context.layout.breakpoint >= (LayoutBreakpoint.md) ? null : const AppDrawer(),
      body: context.layout.breakpoint >= (LayoutBreakpoint.md)
          ? const Row(
              children: [
                AppDrawer(),
                Expanded(child: Center(child: Text('Home'))),
              ],
            )
          : const Center(child: Text('Home')),
    );
  }
}
