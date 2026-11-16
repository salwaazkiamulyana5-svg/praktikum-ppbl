
import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Icon(
          Icons.shield_outlined,
          size: 72,
          color: Theme.of(context).colorScheme.primary,
        ),

        const SizedBox(height: 16),

        Text(
          'Mitigasi Plus Kota Palu',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
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
            subtitle: Text(
              'Pilih menu Edukasi untuk melihat daftar materi.',
            ),
          ),
        ),

        const SizedBox(height: 12),
        const SizedBox(height: 16),

        OutlinedButton(
          onPressed: () => Navigator.pushNamed(
            context,
            AppRoutes.ujiSalah,
          ),
          child: const Text('Uji Route Salah'),
        ),
      ],
    );
  }
}
