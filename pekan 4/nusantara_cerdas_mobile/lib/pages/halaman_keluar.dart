import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class HalamanKeluar extends StatelessWidget {
  const HalamanKeluar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keluar')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Text('Keluar dari sesi demonstrasi?'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.masuk, (route) => false),
          child: const Text('Ya, Keluar'),
        ),
        OutlinedButton(onPressed: () => Navigator.pop(context),
          child: const Text('Batal')),
      ]),
    );
  }
}
