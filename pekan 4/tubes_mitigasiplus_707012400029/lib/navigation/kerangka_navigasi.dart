import 'package:flutter/material.dart';
import '../pages/halaman_beranda.dart';
import '../pages/halaman_edukasi.dart';
import '../pages/halaman_profil.dart';
import '../pages/halaman_kesiapsiagaan.dart';
import '../pages/halaman_statistik_kesiapsiagaan.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeksTerpilih = 0;

  final List<Widget> _halaman = const [
    HalamanBeranda(),
    HalamanEdukasi(),
    HalamanProfil(),
    HalamanKesiapsiagaan(),
    HalamanStatistikKesiapsiagaan(),
  ];

  final List<String> _judul = const ['Beranda', 'Edukasi Mitigasi', 'Profil', 'Kesiapsiagaan', 'Statistik'];

  void _pilihTujuan(int indeks) {
    setState(() {
      _indeksTerpilih = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_judul[_indeksTerpilih])),
      body: _halaman[_indeksTerpilih],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indeksTerpilih,
        onDestinationSelected: _pilihTujuan,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Edukasi',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'Kesiapsiagaan',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Statistik',
          ),
        ],
      ),
    );
  }
}
