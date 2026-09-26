import 'package:flutter/material.dart';
import 'kepala_kota.dart';
import 'kartu_pilar.dart';
import 'panel_laporan.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nusantara Cerdas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const KepalaKota(),

            const SizedBox(height: 20),

            const Text(
              'Pilar Smart City',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const KartuPilar(
              nama: 'Smart Governance',
              ikon: Icons.account_balance,
              deskripsi:
                  'Layanan pemerintahan digital yang mudah diakses warga.',
            ),

            const SizedBox(height: 12),

            const KartuPilar(
              nama: 'Smart Economy',
              ikon: Icons.business,
              deskripsi:
                  'Mendukung pertumbuhan ekonomi melalui teknologi digital.',
            ),

            const SizedBox(height: 12),

            const KartuPilar(
              nama: 'Smart Living',
              ikon: Icons.home,
              deskripsi:
                  'Meningkatkan kualitas hidup masyarakat perkotaan.',
            ),

            const SizedBox(height: 12),

            const KartuPilar(
              nama: 'Smart Mobility',
              ikon: Icons.directions_car,
              deskripsi:
                  'Mewujudkan transportasi kota yang efektif dan nyaman.',
            ),

            const SizedBox(height: 12),

            const KartuPilar(
              nama: 'Smart Environment',
              ikon: Icons.eco,
              deskripsi:
                  'Mengelola lingkungan kota secara berkelanjutan.',
            ),

            const SizedBox(height: 12),

            const KartuPilar(
              nama: 'Smart People',
              ikon: Icons.people,
              deskripsi:
                  'Membangun masyarakat yang kreatif dan berpengetahuan.',
            ),

            const SizedBox(height: 20),

            const PanelLaporanWarga(),
          ],
        ),
      ),
    );
  }
}