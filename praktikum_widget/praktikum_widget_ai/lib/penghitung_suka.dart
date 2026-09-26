import 'package:flutter/material.dart';

class PenghitungSuka extends StatefulWidget {
  const PenghitungSuka({super.key});

  @override
  State<PenghitungSuka> createState() => _PenghitungSukaState();
}

class _PenghitungSukaState extends State<PenghitungSuka> {
  int jumlahSuka = 0;

  void tambahSuka() {
    setState(() {
      jumlahSuka++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Jumlah Suka: $jumlahSuka',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        IconButton(
          onPressed: tambahSuka,
          icon: const Icon(Icons.favorite),
        ),
      ],
    );
  }
}