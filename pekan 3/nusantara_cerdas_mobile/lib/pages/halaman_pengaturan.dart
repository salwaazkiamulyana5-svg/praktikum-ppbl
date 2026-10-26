import 'package:flutter/material.dart';

class HalamanPengaturan extends StatefulWidget {
  const HalamanPengaturan({super.key});
  @override
  State<HalamanPengaturan> createState() => _HalamanPengaturanState();
}

class _HalamanPengaturanState extends State<HalamanPengaturan> {
  bool _notifikasi = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan Kota')),
      body: ListView(children: [
        const ListTile(title: Text('Kota'), subtitle: Text('Nusantara (contoh)')),
        SwitchListTile(title: const Text('Notifikasi layanan'),
          subtitle: const Text('Simulasi; berlaku selama halaman ini terbuka.'),
          value: _notifikasi, onChanged: (nilai) => setState(() => _notifikasi = nilai)),
      ]),
    );
  }
}
