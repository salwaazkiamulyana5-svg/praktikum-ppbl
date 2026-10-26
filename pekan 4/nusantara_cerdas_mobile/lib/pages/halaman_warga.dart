import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/pendaftar_model.dart';
import '../navigation/app_routes.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<PendaftarModel>();
    final daftar = model.daftar;
    return Scaffold(
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const CircleAvatar(radius: 36, child: Icon(Icons.person, size: 38)),
        const SizedBox(height: 12),
        const Center(child: Text('Warga Contoh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        const Center(child: Text('Nusantara Cerdas Mobile')),
        const SizedBox(height: 16),
        Card(child: ListTile(leading: const Icon(Icons.assignment_outlined),
          title: const Text('Riwayat pengajuan'), subtitle: Text('${model.jumlah} pengajuan tersimpan'))),
        if (daftar.isEmpty)
          const Padding(padding: EdgeInsets.all(20), child: Text('Belum ada pengajuan. Tekan tombol + untuk membuat pengajuan baru.'))
        else ...daftar.map((item) => GestureDetector(
          onTap: () => showDialog<void>(context: context, builder: (_) => AlertDialog(
            title: Text('Pengajuan ${item.bidang}'),
            content: Text('Nama: ${item.nama}\nEmail: ${item.email}\nSesi: ${item.sesi}\nStatus: ${item.selesai ? "Selesai" : "Menunggu tindak lanjut"}'),
            actions: [TextButton(onPressed: ()=>Navigator.pop(context), child: const Text('Tutup'))],
          )),
          onLongPress: () {
            context.read<PendaftarModel>().tandaiSelesai(item.id);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(item.selesai ? 'Status pengajuan diperbarui.' : 'Status pengajuan diperbarui.')));
          },
          child: Card(child: ListTile(
            leading: Icon(item.selesai ? Icons.check_circle : Icons.pending_actions, color: item.selesai ? Colors.green : null),
            title: Text(item.bidang), subtitle: Text('${item.nama} • Sesi ${item.sesi}'),
            trailing: Text(item.selesai ? 'Selesai' : 'Diproses'),
          )),
        )),
        const SizedBox(height: 80),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.formulirPengajuan),
        icon: const Icon(Icons.add), label: const Text('Pengajuan baru'),
      ),
    );
  }
}
