import 'package:flutter/material.dart';

class HalamanDetail extends StatelessWidget {
  const HalamanDetail({
    super.key,
    required this.judul,
    required this.keterangan,
  });

  final String judul;
  final String keterangan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Materi')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(judul,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(keterangan),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kembali'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Navigator.pop(
              context,
              'Materi "$judul" selesai dibaca.',
            ),
            child: const Text('Selesai Membaca'),
          ),
        ],
      ),
    );
  }
}
