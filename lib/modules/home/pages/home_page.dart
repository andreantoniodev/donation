import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:layout/layout.dart';

import '../components/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onPageChange(int index) {
    return widget.child.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IEADPE Agreste'), centerTitle: true),
      drawer: context.layout.breakpoint >= (LayoutBreakpoint.md) ? null : AppDrawer(onTap: _onPageChange),
      body: context.layout.breakpoint >= (LayoutBreakpoint.md)
          ? Row(
              children: [
                AppDrawer(onTap: _onPageChange),
                Expanded(child: widget.child),
              ],
            )
          : const Center(child: Text('Home')),
    );
  }
}
