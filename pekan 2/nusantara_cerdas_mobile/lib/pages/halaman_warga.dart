import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        const SizedBox(height: 16),
        const Center(child: Text('Warga Contoh')),
        const Center(child: Text('ID demo: W-001 | Kelurahan Nusantara')),
        const SizedBox(height: 24),
        const Text('Ringkasan riwayat laporan (data contoh)'),
        const ListTile(title: Text('Lampu jalan padam'), subtitle: Text('Diproses')),
        const ListTile(title: Text('Sampah menumpuk'), subtitle: Text('Selesai')),
        ElevatedButton.icon(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.riwayat),
          icon: const Icon(Icons.history), label: const Text('Buka Riwayat Laporan'),
        ),
      ],
    );
  }
}
