import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    const pilar = {
      'Smart Governance': 'Pelayanan dan administrasi publik yang mudah diakses.',
      'Smart Branding': 'Promosi identitas, pariwisata, dan potensi kota.',
      'Smart Economy': 'Dukungan usaha dan kegiatan ekonomi warga.',
      'Smart Living': 'Layanan kesehatan, hunian, dan transportasi.',
      'Smart Society': 'Partisipasi, pendidikan, dan kolaborasi warga.',
      'Smart Environment': 'Pengelolaan sampah dan kelestarian lingkungan.',
    };
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Nusantara Cerdas Mobile',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Purwarupa layanan warga. Seluruh data adalah data contoh.'),
        const SizedBox(height: 16),
        for (final item in pilar.entries)
          Card(child: ListTile(leading: const Icon(Icons.location_city),
            title: Text(item.key), subtitle: Text(item.value))),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.ujiSalah),
          child: const Text('Uji Route Salah'),
        ),
      ],
    );
  }
}
