import 'package:flutter/material.dart';

class HalamanRiwayat extends StatelessWidget {
  const HalamanRiwayat({super.key});

  void _pesan(BuildContext context, String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Laporan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Data contoh; tombol aksi masih berupa simulasi.'),
          ListTile(leading: Icon(Icons.lightbulb_outline),
            title: Text('Lampu jalan padam'), subtitle: Text('Diproses')),
          ListTile(leading: Icon(Icons.delete_outline),
            title: Text('Sampah menumpuk'), subtitle: Text('Selesai')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _pesan(context, 'Simulasi: tambah laporan baru.'),
        tooltip: 'Tambah laporan', child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.search), tooltip: 'Cari',
              onPressed: () => _pesan(context, 'Simulasi: cari laporan.')),
            IconButton(icon: const Icon(Icons.filter_list), tooltip: 'Filter',
              onPressed: () => _pesan(context, 'Simulasi: filter status laporan.')),
            const SizedBox(width: 48),
            IconButton(icon: const Icon(Icons.sort), tooltip: 'Urutkan',
              onPressed: () => _pesan(context, 'Simulasi: urutkan laporan.')),
          ],
        ),
      ),
    );
  }
}
