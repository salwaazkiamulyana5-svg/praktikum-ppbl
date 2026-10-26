import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/pendaftar_model.dart';

class FormulirPengajuanPage extends StatefulWidget {
  const FormulirPengajuanPage({super.key});
  @override
  State<FormulirPengajuanPage> createState() => _FormulirPengajuanPageState();
}

class _FormulirPengajuanPageState extends State<FormulirPengajuanPage> {
  final _nama = TextEditingController();
  final _email = TextEditingController();
  bool _setuju = false;
  String? _sesi;
  String _bidang = 'Administrasi';
  bool _mengirim = false;

  bool get _valid => _nama.text.trim().isNotEmpty &&
      _email.text.trim().contains('@') && _setuju && _sesi != null;

  @override
  void dispose() {
    _nama.dispose();
    _email.dispose();
    super.dispose();
  }

  Future<void> _kirim() async {
    if (!_valid || _mengirim) return;
    setState(() => _mengirim = true);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    context.read<PendaftarModel>().tambah(Pengajuan(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      nama: _nama.text.trim(), email: _email.text.trim(),
      bidang: _bidang, sesi: _sesi!, dibuatPada: DateTime.now(),
    ));
    setState(() => _mengirim = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pengajuan berhasil disimpan.')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Formulir Pengajuan')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      const Text('Lengkapi data untuk mengajukan layanan.'),
      const SizedBox(height: 16),
      TextField(controller: _nama, onChanged: (_) => setState(() {}),
        decoration: const InputDecoration(labelText: 'Nama lengkap', border: OutlineInputBorder())),
      const SizedBox(height: 12),
      TextField(controller: _email, onChanged: (_) => setState(() {}),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(labelText: 'Email', border: const OutlineInputBorder(),
          errorText: _email.text.isNotEmpty && !_email.text.contains('@') ? 'Email harus mengandung @' : null)),
      const SizedBox(height: 12),
      DropdownButtonFormField<String>(
        value: _bidang, decoration: const InputDecoration(labelText: 'Bidang layanan', border: OutlineInputBorder()),
        items: const ['Administrasi','Kependudukan','Infrastruktur'].map((e)=>DropdownMenuItem(value:e,child:Text(e))).toList(),
        onChanged: (v)=>setState(()=>_bidang=v ?? 'Administrasi')),
      CheckboxListTile(contentPadding: EdgeInsets.zero, value: _setuju,
        title: const Text('Saya menyetujui penggunaan data pribadi untuk proses layanan'),
        onChanged: (v)=>setState(()=>_setuju=v ?? false)),
      const Text('Pilih sesi kunjungan'),
      ...['Pagi','Siang','Sore'].map((s)=>RadioListTile<String>(
        contentPadding: EdgeInsets.zero, title: Text(s), value:s, groupValue:_sesi,
        onChanged:(v)=>setState(()=>_sesi=v))),
      const SizedBox(height: 8),
      ElevatedButton.icon(
        onPressed: _valid && !_mengirim ? _kirim : null,
        icon: _mengirim ? const SizedBox(width:18,height:18,child:CircularProgressIndicator(strokeWidth:2)) : const Icon(Icons.send),
        label: Text(_mengirim ? 'Mengirim...' : 'Kirim Pengajuan')),
    ]),
  );
}
