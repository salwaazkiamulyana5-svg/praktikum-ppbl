import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/favorit_cubit.dart';
import '../cubit/pengajuan_cubit.dart';
import '../model/pendaftar_model.dart';
import '../navigation/app_routes.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});
  @override
  Widget build(BuildContext context) => BlocBuilder<PengajuanCubit, List<Pengajuan>>(
    builder: (context, raw) {
      final daftar = raw;
      return Scaffold(body: ListView(padding: const EdgeInsets.all(16), children: [
        const CircleAvatar(radius: 36, child: Icon(Icons.person, size: 38)),
        const SizedBox(height: 12), const Center(child: Text('Warga Contoh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        const Center(child: Text('Nusantara Cerdas Mobile')), const SizedBox(height: 16),
        Card(child: ListTile(leading: const Icon(Icons.assignment_outlined), title: const Text('Keranjang pengajuan'), subtitle: Text('${daftar.length} layanan diajukan'))),
        const SizedBox(height: 8), Text('Layanan Favorit', style: Theme.of(context).textTheme.titleLarge),
        BlocBuilder<FavoritCubit, Set<String>>(builder: (context, favorit) => favorit.isEmpty
          ? const Padding(padding: EdgeInsets.all(12), child: Text('Belum ada layanan favorit. Tandai layanan dengan ikon bintang pada tujuan Layanan.'))
          : Wrap(spacing: 8, runSpacing: 8, children: favorit.map((nama) => ActionChip(avatar: const Icon(Icons.star, color: Colors.amber), label: Text(nama), onPressed: () => Navigator.pushNamed(context, AppRoutes.detail, arguments: _dataLayanan(nama)))).toList())),
        const Divider(height: 28), Text('Riwayat Pengajuan', style: Theme.of(context).textTheme.titleLarge),
        if (daftar.isEmpty) const Padding(padding: EdgeInsets.all(16), child: Text('Belum ada pengajuan. Tekan tombol + untuk membuat pengajuan baru.')),
        ...daftar.map((item) => GestureDetector(
          onTap: () => showDialog<void>(context: context, builder: (_) => AlertDialog(title: Text('Pengajuan ${item.bidang}'), content: Text('Nama: ${item.nama}\nEmail: ${item.email}\nSesi: ${item.sesi}\nStatus: ${item.selesai ? "Selesai" : "Menunggu tindak lanjut"}'), actions: [TextButton(onPressed: ()=>Navigator.pop(context), child: const Text('Tutup'))])),
          onLongPress: () { context.read<PengajuanCubit>().tandaiSelesai(item.id); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Status pengajuan diperbarui.'))); },
          child: Card(child: ListTile(leading: Icon(item.selesai ? Icons.check_circle : Icons.pending_actions, color: item.selesai ? Colors.green : null), title: Text(item.bidang), subtitle: Text('${item.nama} • Sesi ${item.sesi}'), trailing: Text(item.selesai ? 'Selesai' : 'Diproses'))),
        )), const SizedBox(height: 80),
      ]), floatingActionButton: FloatingActionButton.extended(onPressed: () => Navigator.pushNamed(context, AppRoutes.formulirPengajuan), icon: const Icon(Icons.add), label: const Text('Pengajuan baru')));
    });
}

Map<String,String> _dataLayanan(String nama) {
  const semua = <String,Map<String,String>>{
    'Izin Usaha': {'nama':'Izin Usaha','dinas':'Dinas Penanaman Modal dan PTSP','jam':'Senin-Jumat, 08.00-15.00','keterangan':'Pengajuan izin untuk kegiatan usaha warga.'},
    'Izin Bangunan': {'nama':'Izin Bangunan','dinas':'Dinas Penanaman Modal dan PTSP','jam':'Senin-Jumat, 08.00-14.00','keterangan':'Informasi dan pengajuan perizinan bangunan.'},
    'Izin Kegiatan': {'nama':'Izin Kegiatan','dinas':'Dinas Penanaman Modal dan PTSP','jam':'Senin-Jumat, 09.00-15.00','keterangan':'Pengajuan izin kegiatan masyarakat.'},
    'Pendaftaran Puskesmas': {'nama':'Pendaftaran Puskesmas','dinas':'Dinas Kesehatan','jam':'Senin-Sabtu, 07.00-12.00','keterangan':'Pendaftaran pelayanan kesehatan di puskesmas.'},
    'Layanan Imunisasi': {'nama':'Layanan Imunisasi','dinas':'Dinas Kesehatan','jam':'Senin dan Rabu, 08.00-11.00','keterangan':'Pendaftaran imunisasi sesuai jadwal layanan.'},
    'Pemeriksaan Kesehatan': {'nama':'Pemeriksaan Kesehatan','dinas':'Dinas Kesehatan','jam':'Selasa dan Kamis, 08.00-12.00','keterangan':'Permohonan pemeriksaan kesehatan dasar.'},
    'Kartu Bus Kota': {'nama':'Kartu Bus Kota','dinas':'Dinas Perhubungan','jam':'Senin-Jumat, 08.00-16.00','keterangan':'Permohonan kartu pengguna angkutan bus kota.'},
    'Uji Kendaraan': {'nama':'Uji Kendaraan','dinas':'Dinas Perhubungan','jam':'Senin-Jumat, 08.00-13.00','keterangan':'Pendaftaran pengujian berkala kendaraan.'},
    'Layanan Parkir': {'nama':'Layanan Parkir','dinas':'Dinas Perhubungan','jam':'Senin-Jumat, 09.00-14.00','keterangan':'Permohonan informasi dan layanan parkir resmi.'},
  };
  return semua[nama] ?? {'nama':nama,'dinas':'Layanan Pemerintah','jam':'Jam layanan mengikuti ketentuan dinas','keterangan':'Informasi layanan warga.'};
}
