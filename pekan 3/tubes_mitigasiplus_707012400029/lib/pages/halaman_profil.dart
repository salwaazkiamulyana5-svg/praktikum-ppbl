import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/materi_favorit_model.dart';

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MateriFavoritModel>();
    final daftarMateri = model.materiTersimpan.toList()..sort();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        const SizedBox(height: 16),
        const Center(child: Text('Euis')),
        const Center(child: Text('Kota Palu')),
        const SizedBox(height: 24),
        const Text('Profil aplikasi Mitigasi Plus.'),
        const SizedBox(height: 24),
        Text(
          'Materi Tersimpan (${model.jumlahMateriTersimpan})',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        if (daftarMateri.isEmpty)
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Belum ada materi yang disimpan. Buka menu Edukasi '
                'dan tekan ikon bookmark pada materi pilihan.',
              ),
            ),
          )
        else
          ...daftarMateri.map(
            (judul) => Card(
              child: ListTile(
                leading: const Icon(Icons.bookmark, color: Colors.teal),
                title: Text(judul),
                trailing: IconButton(
                  tooltip: 'Hapus dari tersimpan',
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    context.read<MateriFavoritModel>().toggle(judul);
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
