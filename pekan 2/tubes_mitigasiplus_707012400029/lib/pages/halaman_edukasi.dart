import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class HalamanEdukasi extends StatefulWidget {
  const HalamanEdukasi({super.key});

  @override
  State<HalamanEdukasi> createState() => _HalamanEdukasiState();
}

class _HalamanEdukasiState extends State<HalamanEdukasi> {
  String _pesan = 'Belum ada materi yang selesai dibaca.';

  final List<Map<String, String>> _daftarMateri = const [
    {
      'judul': 'Mengenal Gempa Bumi',
      'keterangan':
          ' Materi ini dirancang untuk membahas '
          'pengenalan gempa bumi dan kesiapsiagaan masyarakat Kota Palu.',
    },
    {
      'judul': 'Mengenal Tsunami',
      'keterangan':
          ' Materi ini dirancang untuk membahas '
          'pengenalan tsunami dan pentingnya memahami informasi evakuasi resmi.',
    },
    {
      'judul': 'Mengenal Banjir',
      'keterangan':
          ' Materi ini dirancang untuk membahas '
          'pengenalan banjir dan persiapan masyarakat menghadapi bencana.',
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
    return Column(
      children: [
        Padding(padding: const EdgeInsets.all(16), child: Text(_pesan)),
        Expanded(
          child: ListView.separated(
            itemCount: _daftarMateri.length,
            separatorBuilder: (context, indeks) => const Divider(height: 1),
            itemBuilder: (context, indeks) {
              final materi = _daftarMateri[indeks];
              return ListTile(
                leading: const Icon(Icons.menu_book_outlined),
                title: Text(materi['judul']!),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _bukaDetail(materi),
              );
            },
          ),
        ),
      ],
    );
  }
}
