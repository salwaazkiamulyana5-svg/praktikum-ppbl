import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';

class HalamanDetail extends StatefulWidget {
  const HalamanDetail({
    super.key,
    required this.nama,
    required this.dinas,
    required this.jam,
    required this.keterangan,
  });

  final String nama;
  final String dinas;
  final String jam;
  final String keterangan;

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool _sedangMengirim = false;

  Future<void> _ajukanPermohonan() async {
    if (_sedangMengirim) return;

    setState(() => _sedangMengirim = true);

    // Simulasi proses pengiriman. Data tidak dikirim ke instansi sungguhan.
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;

    context.read<PengajuanModel>().tambah({
      'nama': widget.nama,
      'dinas': widget.dinas,
      'jam': widget.jam,
      'keterangan': widget.keterangan,
    });

    Navigator.pop(context, 'Permohonan ${widget.nama} berhasil ditambahkan ke daftar pengajuan.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rincian Layanan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            widget.nama,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text('Dinas penanggung jawab: ${widget.dinas}'),
          const SizedBox(height: 12),
          Text('Jam operasional: ${widget.jam}'),
          const SizedBox(height: 12),
          Text(widget.keterangan),
          const SizedBox(height: 24),
          const Text(
            'Simulasi praktikum: pengajuan tidak dikirim ke instansi.',
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: _sedangMengirim ? null : _ajukanPermohonan,
            icon: _sedangMengirim
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send),
            label: Text(
              _sedangMengirim
                  ? 'Sedang mengirim permohonan...'
                  : 'Ajukan Permohonan',
            ),
          ),
          OutlinedButton(
            onPressed: _sedangMengirim ? null : () => Navigator.pop(context),
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}
