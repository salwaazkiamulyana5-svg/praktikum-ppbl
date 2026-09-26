import 'package:flutter/material.dart';

class PanelLaporanWarga extends StatefulWidget {
  const PanelLaporanWarga({super.key});

  @override
  State<PanelLaporanWarga> createState() => _PanelLaporanWargaState();
}

class _PanelLaporanWargaState extends State<PanelLaporanWarga> {
  int jumlahLaporan = 0;

  void laporanMasuk() {
    setState(() {
      jumlahLaporan++;
    });
  }

  void laporanSelesai() {
    setState(() {
      if (jumlahLaporan > 0) {
        jumlahLaporan--;
      }
    });
  }

  void resetHarian() {
    setState(() {
      jumlahLaporan = 0;
    });
  }

  String getStatusPelayanan() {
    if (jumlahLaporan < 5) {
      return 'Pelayanan Lancar';
    } else if (jumlahLaporan <= 10) {
      return 'Pelayanan Sibuk';
    } else {
      return 'Perlu Penambahan Petugas';
    }
  }

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
        children: [
          const Text(
            'Laporan Warga',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Jumlah Laporan: $jumlahLaporan',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            getStatusPelayanan(),
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: laporanMasuk,
            child: const Text('Laporan Masuk'),
          ),
          ElevatedButton(
            onPressed: laporanSelesai,
            child: const Text('Laporan Selesai'),
          ),
          ElevatedButton(
            onPressed: resetHarian,
            child: const Text('Reset Harian'),
          ),
        ],
      ),
    );
  }
}