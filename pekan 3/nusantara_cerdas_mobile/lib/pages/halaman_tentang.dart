import 'package:flutter/material.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Nusantara Cerdas Mobile adalah purwarupa layanan warga '
          'untuk praktikum navigasi Flutter. Aplikasi menggunakan named routes, '
          'NavigationBar, NavigationDrawer, tab navigation, BottomAppBar, dan '
          'NavigationRail adaptif. Seluruh identitas dan layanan merupakan data contoh.'),
      ),
    );
  }
}
