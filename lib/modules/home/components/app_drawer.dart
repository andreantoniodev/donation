import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import '../../../core/theme/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: context.layout.breakpoint >= (LayoutBreakpoint.md) ? const RoundedRectangleBorder() : null,
      width: context.layout.breakpoint >= (LayoutBreakpoint.md) ? 250 : null,
      backgroundColor: AppColors.secondary,
      child: ListView(
        children: const [
          DrawerHeader(child: Text('Teste')),
          ListTile(title: Text('Doações'), leading: Icon(Icons.handshake)),
          ListTile(title: Text('Estoque'), leading: Icon(Icons.inventory)),
          ListTile(title: Text('Usuários'), leading: Icon(Icons.people)),
          ListTile(title: Text('Alimentos'), leading: Icon(Icons.food_bank)),
        ],
      ),
    );
  }
}
