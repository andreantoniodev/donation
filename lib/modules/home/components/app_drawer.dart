import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import '../../../core/theme/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.onTap});

  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: context.layout.breakpoint >= (LayoutBreakpoint.md) ? const RoundedRectangleBorder() : null,
      width: context.layout.breakpoint >= (LayoutBreakpoint.md) ? 250 : null,
      backgroundColor: AppColors.secondary,
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Teste')),
          ListTile(title: const Text('Doações'), leading: const Icon(Icons.handshake), onTap: () => onTap(0)),
          ListTile(title: const Text('Alimentos'), leading: const Icon(Icons.food_bank), onTap: () => onTap(1)),
          ListTile(title: const Text('Estoque'), leading: const Icon(Icons.inventory), onTap: () => onTap(2)),
          ListTile(title: const Text('Usuários'), leading: const Icon(Icons.people), onTap: () => onTap(3)),
        ],
      ),
    );
  }
}
