import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../models/pengajuan_model.dart';
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

        Text('Layanan Favorit', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Consumer<FavoritModel>(
          builder: (context, model, child) {
            final favorit = model.layananFavorit.toList()..sort();
            if (favorit.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Belum ada layanan favorit. Buka tab Layanan dan tekan ikon bintang untuk menyimpan layanan.',
                  ),
                ),
              );
            }
            return Card(
              child: Column(
                children: favorit.map((nama) => ListTile(
                  leading: const Icon(Icons.star, color: Colors.amber),
                  title: Text(nama),
                  trailing: IconButton(
                    tooltip: 'Hapus dari favorit',
                    icon: const Icon(Icons.star_border),
                    onPressed: () => context
                        .read<FavoritModel>()
                        .batalTandai(nama),
                  ),
                )).toList(),
              ),
            );
          },
        ),

        const SizedBox(height: 20),
        Text('Pengajuan Layanan', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Consumer<PengajuanModel>(
          builder: (context, model, child) {
            if (model.daftarPengajuan.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Belum ada layanan yang diajukan.'),
                ),
              );
            }
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.assignment_turned_in_outlined),
                    title: const Text('Total layanan diajukan'),
                    trailing: Text(
                      '${model.totalPengajuan}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const Divider(height: 1),
                  ...model.daftarPengajuan.map((layanan) => ListTile(
                    leading: const Icon(Icons.description_outlined),
                    title: Text(layanan['nama'] ?? 'Layanan'),
                    subtitle: Text(layanan['dinas'] ?? ''),
                    trailing: IconButton(
                      tooltip: 'Hapus pengajuan dari daftar',
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => context
                          .read<PengajuanModel>()
                          .hapus(layanan['nama'] ?? ''),
                    ),
                  )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: model.kosongkan,
                      icon: const Icon(Icons.delete_sweep_outlined),
                      label: const Text('Kosongkan daftar'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 20),
        const Text('Ringkasan riwayat laporan (data contoh)'),
        const ListTile(title: Text('Lampu jalan padam'), subtitle: Text('Diproses')),
        const ListTile(title: Text('Sampah menumpuk'), subtitle: Text('Selesai')),
        ElevatedButton.icon(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.riwayat),
          icon: const Icon(Icons.history),
          label: const Text('Buka Riwayat Laporan'),
        ),
      ],
    );
  }
}
