import 'package:flutter/material.dart';

class StockListPage extends StatelessWidget {
  const StockListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estoque')),
      body: const Center(child: Text('Página de Estoque')),
    );
  }
}
