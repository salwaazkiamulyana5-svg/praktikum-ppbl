import 'package:flutter/material.dart';

class HalamanDetail extends StatelessWidget {
  const HalamanDetail({super.key, required this.nama, required this.dinas,
    required this.jam, required this.keterangan});

  final String nama;
  final String dinas;
  final String jam;
  final String keterangan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rincian Layanan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(nama, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text('Dinas penanggung jawab: $dinas'),
          const SizedBox(height: 12),
          Text('Jam operasional: $jam'),
          const SizedBox(height: 12),
          Text(keterangan),
          const SizedBox(height: 24),
          const Text('Simulasi praktikum: pengajuan tidak dikirim ke instansi.'),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context, 'Permohonan $nama telah diajukan.'),
            icon: const Icon(Icons.send),
            label: const Text('Ajukan Permohonan'),
          ),
          OutlinedButton(onPressed: () => Navigator.pop(context),
            child: const Text('Kembali')),
        ],
      ),
    );
  }
}
