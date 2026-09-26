import 'package:flutter/material.dart';
import 'profil_card.dart';
import 'penghitung_suka.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('Praktikum Widget Flutter'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfilCard(
              nama: 'Ahmad Rizky',
              nim: '123456789',
              prodi: 'Teknik Informatika',
            ),
            const SizedBox(height: 24),
            const Text(
              'Statistik Interaksi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const PenghitungSuka(),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: KotakInfo(
                    judul: 'Semester',
                    isi: 'Semester 5',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: KotakInfo(
                    judul: 'Keahlian',
                    isi: 'Flutter & Mobile',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class KotakInfo extends StatelessWidget {
  final String judul;
  final String isi;

  const KotakInfo({
    super.key,
    required this.judul,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            judul,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isi,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}