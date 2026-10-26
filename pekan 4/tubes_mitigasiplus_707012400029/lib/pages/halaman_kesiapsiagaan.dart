import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/kesiapsiagaan_model.dart';

class HalamanKesiapsiagaan extends StatefulWidget {
  const HalamanKesiapsiagaan({super.key});
  @override
  State<HalamanKesiapsiagaan> createState() => _HalamanKesiapsiagaanState();
}
class _HalamanKesiapsiagaanState extends State<HalamanKesiapsiagaan> {
  final _nama = TextEditingController();
  bool _tasSiaga = false;
  String _risiko = 'Gempa';
  @override
  void dispose(){_nama.dispose();super.dispose();}
  void _simpan(){
    if(_nama.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Nama harus diisi.')));
      return;
    }
    context.read<KesiapsiagaanModel>().tambah(CatatanKesiapsiagaan(
      nama:_nama.text.trim(),risiko:_risiko,punyaTasSiaga:_tasSiaga,waktu:DateTime.now()));
    _nama.clear();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Catatan kesiapsiagaan tersimpan.')));
  }
  @override
  Widget build(BuildContext context){
    final model=context.watch<KesiapsiagaanModel>();
    return Scaffold(appBar:AppBar(title:const Text('Cek Kesiapsiagaan')),
      body:ListView(padding:const EdgeInsets.all(16),children:[
        const Text('Catat kesiapan menghadapi risiko bencana di sekitar Anda.'),
        const SizedBox(height:12),
        TextField(controller:_nama,decoration:const InputDecoration(labelText:'Nama warga',border:OutlineInputBorder())),
        const SizedBox(height:12),
        const Text('Risiko bencana yang ingin dipersiapkan'),
        ...['Gempa','Tsunami','Banjir'].map((v)=>RadioListTile<String>(title:Text(v),value:v,groupValue:_risiko,onChanged:(n)=>setState(()=>_risiko=n??'Gempa'))),
        CheckboxListTile(contentPadding:EdgeInsets.zero,value:_tasSiaga,title:const Text('Saya sudah menyiapkan tas siaga'),onChanged:(v)=>setState(()=>_tasSiaga=v??false)),
        ElevatedButton.icon(onPressed:_simpan,icon:const Icon(Icons.save),label:const Text('Simpan Catatan')),
        const SizedBox(height:20),
        Text('Catatan tersimpan: ${model.total}',style:Theme.of(context).textTheme.titleMedium),
        ...model.catatan.map((e)=>ListTile(leading:Icon(e.punyaTasSiaga?Icons.check_circle:Icons.warning_amber),title:Text(e.nama),subtitle:Text('${e.risiko} • Tas siaga: ${e.punyaTasSiaga?"Sudah":"Belum"}'))),
      ])
    );
  }
}
