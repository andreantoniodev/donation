import 'package:flutter/material.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alimentos')),
      body: const Center(child: Text('Página de Alimentos')),
    );
  }
}
