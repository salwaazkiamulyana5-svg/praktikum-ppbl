import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class HalamanMasuk extends StatelessWidget {
  const HalamanMasuk({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sesi Berakhir')),
      body: Center(child: ElevatedButton(
        onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.beranda),
        child: const Text('Masuk sebagai Warga Demo'),
      )),
    );
  }
}
