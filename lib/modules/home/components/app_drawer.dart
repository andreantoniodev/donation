import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(accountName: Text('Teste'), accountEmail: Text('teste@teste.com')),
          Card(
            child: ListTile(title: const Text('Doações'), leading: const Icon(Icons.handshake)),
          ),
          ListTile(title: const Text('Estoque'), leading: const Icon(Icons.inventory)),
          ListTile(title: const Text('Usuários'), leading: const Icon(Icons.people)),
          ListTile(title: const Text('Alimentos'), leading: const Icon(Icons.food_bank)),
        ],
      ),
    );
  }
}
