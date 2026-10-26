import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/materi_favorit_model.dart';
import '../navigation/app_routes.dart';

class HalamanEdukasi extends StatefulWidget {
  const HalamanEdukasi({super.key});

  @override
  State<HalamanEdukasi> createState() => _HalamanEdukasiState();
}

class _HalamanEdukasiState extends State<HalamanEdukasi> {
  // State lokal halaman Edukasi untuk pesan hasil navigasi detail.
  String _pesan = 'Belum ada materi yang selesai dibaca.';

  final List<Map<String, String>> _daftarMateri = const [
    {
      'judul': 'Mengenal Gempa Bumi',
      'keterangan':
          'Materi ini dirancang untuk membahas pengenalan gempa bumi '
          'dan kesiapsiagaan masyarakat Kota Palu.',
    },
    {
      'judul': 'Mengenal Tsunami',
      'keterangan':
          'Materi ini dirancang untuk membahas pengenalan tsunami '
          'dan pentingnya memahami informasi evakuasi resmi.',
    },
    {
      'judul': 'Mengenal Banjir',
      'keterangan':
          'Materi ini dirancang untuk membahas pengenalan banjir '
          'dan persiapan masyarakat menghadapi bencana.',
    },
  ];

  Future<void> _bukaDetail(Map<String, String> materi) async {
    final hasil = await Navigator.pushNamed<String>(
      context,
      AppRoutes.detail,
      arguments: materi,
    );

    if (!mounted) return;
    setState(() {
      _pesan = hasil ?? 'Halaman detail ditutup tanpa menandai selesai.';
    });
  }

  @override
  Widget build(BuildContext context) {
    final materiTersimpan = context.watch<MateriFavoritModel>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Text(_pesan),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Materi tersimpan: ${materiTersimpan.jumlahMateriTersimpan}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: _daftarMateri.length,
            separatorBuilder: (context, indeks) => const Divider(height: 1),
            itemBuilder: (context, indeks) {
              final materi = _daftarMateri[indeks];
              final judul = materi['judul']!;
              final tersimpan = materiTersimpan.isTersimpan(judul);

              return ListTile(
                leading: const Icon(Icons.menu_book_outlined),
                title: Text(judul),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      tooltip: tersimpan ? 'Hapus dari tersimpan' : 'Simpan materi',
                      icon: Icon(
                        tersimpan ? Icons.bookmark : Icons.bookmark_border,
                        color: tersimpan ? Colors.teal : null,
                      ),
                      onPressed: () {
                        context.read<MateriFavoritModel>().toggle(judul);
                      },
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () => _bukaDetail(materi),
              );
            },
          ),
        ),
      ],
    );
  }
}
