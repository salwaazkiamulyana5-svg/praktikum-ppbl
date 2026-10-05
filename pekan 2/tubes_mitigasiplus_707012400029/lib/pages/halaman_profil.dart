import 'package:flutter/material.dart';

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        SizedBox(height: 16),
        Center(child: Text('Euis')),
        Center(child: Text('Kota Palu')),
        SizedBox(height: 24),
        Text('Profil aplikasi Mitigasi Plus.'),
      ],
    );
  }
}
