import 'package:flutter/material.dart';
import '../pages/halaman_beranda.dart';
import '../pages/halaman_layanan.dart';
import '../pages/halaman_warga.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeksTerpilih = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _halaman = const [
    HalamanBeranda(), HalamanLayanan(), HalamanWarga(),
  ];
  final List<String> _judul = const ['Beranda', 'Layanan', 'Warga'];

  void _pilihTujuan(int indeks) {
    setState(() => _indeksTerpilih = indeks);
  }

  @override
  Widget build(BuildContext context) {
    final double lebar = MediaQuery.of(context).size.width;
    final bool layarLebar = lebar >= 600;
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
          _scaffoldKey.currentState?.closeDrawer();
        } else if (_indeksTerpilih != 0) {
          _pilihTujuan(0);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Gunakan menu Keluar untuk keluar dari sesi.')),
          );
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text(_judul[_indeksTerpilih])),
        drawer: _buatDrawer(),
        body: SafeArea(
          child: layarLebar ? _tataLetakLebar() : _halaman[_indeksTerpilih],
        ),
        bottomNavigationBar: layarLebar ? null : _buatBilahBawah(),
      ),
    );
  }

  Widget _buatBilahBawah() {
    return NavigationBar(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: _pilihTujuan,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home), label: 'Beranda'),
        NavigationDestination(icon: Icon(Icons.grid_view_outlined),
          selectedIcon: Icon(Icons.grid_view), label: 'Layanan'),
        NavigationDestination(icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person), label: 'Warga'),
      ],
    );
  }

  Widget _tataLetakLebar() {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _indeksTerpilih,
          onDestinationSelected: _pilihTujuan,
          extended: true,
          destinations: const [
            NavigationRailDestination(icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home), label: Text('Beranda')),
            NavigationRailDestination(icon: Icon(Icons.grid_view_outlined),
              selectedIcon: Icon(Icons.grid_view), label: Text('Layanan')),
            NavigationRailDestination(icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person), label: Text('Warga')),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: _halaman[_indeksTerpilih]),
      ],
    );
  }

  void _bukaMenu(String route) {
    Navigator.pop(context); 
    Navigator.pushNamed(context, route);
  }

  Widget _buatDrawer() {
    return NavigationDrawer(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: (indeks) {
        _pilihTujuan(indeks);
        Navigator.pop(context);
      },
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Warga Contoh'),
          accountEmail: Text('Akun demonstrasi'),
          currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
        ),
        const NavigationDrawerDestination(icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home), label: Text('Beranda')),
        const NavigationDrawerDestination(icon: Icon(Icons.grid_view_outlined),
          selectedIcon: Icon(Icons.grid_view), label: Text('Layanan')),
        const NavigationDrawerDestination(icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person), label: Text('Warga')),
        const Divider(indent: 28, endIndent: 28),
        ListTile(leading: const Icon(Icons.settings_outlined),
          title: const Text('Pengaturan Kota'),
          onTap: () => _bukaMenu(AppRoutes.pengaturan)),
        ListTile(leading: const Icon(Icons.info_outline),
          title: const Text('Tentang Aplikasi'),
          onTap: () => _bukaMenu(AppRoutes.tentang)),
        ListTile(leading: const Icon(Icons.logout), title: const Text('Keluar'),
          onTap: () => _bukaMenu(AppRoutes.keluar)),
      ],
    );
  }
}
