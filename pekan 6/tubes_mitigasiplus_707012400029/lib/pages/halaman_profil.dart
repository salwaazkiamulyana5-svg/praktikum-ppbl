import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/theme_cubit.dart';

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        const SizedBox(height: 16),
        const Center(child: Text('Euis')),
        const Center(child: Text('Kota Palu')),
        const SizedBox(height: 24),
        const Text('Profil aplikasi Mitigasi Plus.'),
        const SizedBox(height: 16),
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, mode) => SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Mode gelap'),
            subtitle: const Text('Ubah tampilan aplikasi ke mode terang atau gelap.'),
            value: mode == ThemeMode.dark,
            onChanged: (_) => context.read<ThemeCubit>().toggle(),
          ),
        ),
      ],
    );
  }
}
