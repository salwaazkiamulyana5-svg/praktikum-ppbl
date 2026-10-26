import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class HalamanLayanan extends StatelessWidget {
  const HalamanLayanan({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.description_outlined), text: 'Perizinan'),
              Tab(icon: Icon(Icons.local_hospital_outlined), text: 'Kesehatan'),
              Tab(icon: Icon(Icons.directions_bus_outlined), text: 'Transportasi'),
            ],
          ),
          Expanded(child: TabBarView(children: [
          _buatDaftarLayanan(const [
            {'nama': "Izin Usaha", 'dinas': "Dinas Penanaman Modal dan PTSP", 'jam': "Senin-Jumat, 08.00-15.00", 'keterangan': "Pengajuan izin untuk kegiatan usaha warga."},
            {'nama': "Izin Bangunan", 'dinas': "Dinas Penanaman Modal dan PTSP", 'jam': "Senin-Jumat, 08.00-14.00", 'keterangan': "Informasi dan pengajuan perizinan bangunan."},
            {'nama': "Izin Kegiatan", 'dinas': "Dinas Penanaman Modal dan PTSP", 'jam': "Senin-Jumat, 09.00-15.00", 'keterangan': "Pengajuan izin kegiatan masyarakat."},
          ]),
          _buatDaftarLayanan(const [
            {'nama': "Pendaftaran Puskesmas", 'dinas': "Dinas Kesehatan", 'jam': "Senin-Sabtu, 07.00-12.00", 'keterangan': "Pendaftaran pelayanan kesehatan di puskesmas."},
            {'nama': "Layanan Imunisasi", 'dinas': "Dinas Kesehatan", 'jam': "Senin dan Rabu, 08.00-11.00", 'keterangan': "Pendaftaran imunisasi sesuai jadwal layanan."},
            {'nama': "Pemeriksaan Kesehatan", 'dinas': "Dinas Kesehatan", 'jam': "Selasa dan Kamis, 08.00-12.00", 'keterangan': "Permohonan pemeriksaan kesehatan dasar."},
          ]),
          _buatDaftarLayanan(const [
            {'nama': "Kartu Bus Kota", 'dinas': "Dinas Perhubungan", 'jam': "Senin-Jumat, 08.00-16.00", 'keterangan': "Permohonan kartu pengguna angkutan bus kota."},
            {'nama': "Uji Kendaraan", 'dinas': "Dinas Perhubungan", 'jam': "Senin-Jumat, 08.00-13.00", 'keterangan': "Pendaftaran pengujian berkala kendaraan."},
            {'nama': "Layanan Parkir", 'dinas': "Dinas Perhubungan", 'jam': "Senin-Jumat, 09.00-14.00", 'keterangan': "Permohonan informasi dan layanan parkir resmi."},
          ]),
          ])),
        ],
      ),
    );
  }

  Widget _buatDaftarLayanan(List<Map<String, String>> daftarLayanan) {
    return ListView.separated(
      itemCount: daftarLayanan.length,
      separatorBuilder: (context, indeks) => const Divider(height: 1),
      itemBuilder: (itemContext, indeks) {
        final layanan = daftarLayanan[indeks];
        return ListTile(
          leading: const Icon(Icons.assignment_outlined),
          title: Text(layanan['nama']!),
          subtitle: Text(layanan['dinas']!),
          trailing: const Icon(Icons.chevron_right),
          onTap: () async {
            final hasil = await Navigator.pushNamed<String>(
              itemContext, AppRoutes.detail, arguments: layanan,
            );
            if (!itemContext.mounted) return;
            if (hasil != null) {
              ScaffoldMessenger.of(itemContext).showSnackBar(
                SnackBar(content: Text(hasil)),
              );
            }
          },
        );
      },
    );
  }
}
