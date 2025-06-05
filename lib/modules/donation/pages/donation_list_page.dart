import 'package:flutter/material.dart';

class DonationListPage extends StatelessWidget {
  const DonationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doações')),
      body: const Center(child: Text('Página de Doações')),
    );
  }
}
