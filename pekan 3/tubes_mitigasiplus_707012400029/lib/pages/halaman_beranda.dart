import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class HalamanBeranda extends StatefulWidget {
  const HalamanBeranda({super.key});

  @override
  State<HalamanBeranda> createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  // State lokal: hanya halaman Beranda yang membutuhkan status ini.
  bool _tampilkanChecklist = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Icon(Icons.shield_outlined, size: 72, color: Colors.teal),
        const SizedBox(height: 16),
        const Text(
          'Mitigasi Plus Kota Palu',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text(
          'Kerangka aplikasi edukasi mitigasi bencana untuk masyarakat Kota Palu.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        const Card(
          child: ListTile(
            leading: Icon(Icons.menu_book),
            title: Text('Belajar Mitigasi'),
            subtitle: Text('Pilih menu Edukasi untuk melihat daftar materi.'),
          ),
        ),
        const SizedBox(height: 12),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Tampilkan checklist kesiapsiagaan'),
          subtitle: Text(
            _tampilkanChecklist
                ? 'Checklist sedang ditampilkan'
                : 'Checklist disembunyikan',
          ),
          value: _tampilkanChecklist,
          onChanged: (nilai) {
            setState(() {
              _tampilkanChecklist = nilai;
            });
          },
        ),
        if (_tampilkanChecklist)
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Checklist Kesiapsiagaan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('• Kenali jalur evakuasi di sekitar.'),
                  Text('• Siapkan tas siaga dan perlengkapan penting.'),
                  Text('• Ikuti informasi dari sumber resmi.'),
                ],
              ),
            ),
          ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.ujiSalah),
          child: const Text('Uji Route Salah'),
        ),
      ],
    );
  }
}
