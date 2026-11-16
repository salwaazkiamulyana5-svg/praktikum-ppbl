import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/pengajuan_cubit.dart';
import '../model/pendaftar_model.dart';

class HalamanDetail extends StatefulWidget {
 const HalamanDetail({super.key,required this.nama,required this.dinas,required this.jam,required this.keterangan});
 final String nama,dinas,jam,keterangan;
 @override State<HalamanDetail> createState()=>_HalamanDetailState();
}
class _HalamanDetailState extends State<HalamanDetail>{ bool _mengirim=false;
 Future<void> _ajukan() async {
  if(_mengirim)return; setState(()=>_mengirim=true);
  await Future.delayed(const Duration(milliseconds:900));
  if(!mounted)return;
  context.read<PengajuanCubit>().tambah(Pengajuan(id:DateTime.now().microsecondsSinceEpoch.toString(),nama:'Warga Contoh',email:'-',bidang:widget.nama,sesi:'Belum dipilih',dibuatPada:DateTime.now()));
  Navigator.pop(context,'Permohonan ${widget.nama} telah ditambahkan ke pengajuan.');
 }
 @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Rincian Layanan')),body:ListView(padding:const EdgeInsets.all(16),children:[
 Text(widget.nama,style:const TextStyle(fontSize:24,fontWeight:FontWeight.bold)),const SizedBox(height:16),Text('Dinas penanggung jawab: ${widget.dinas}'),const SizedBox(height:12),Text('Jam operasional: ${widget.jam}'),const SizedBox(height:12),Text(widget.keterangan),const SizedBox(height:24),const Text('Permohonan akan ditambahkan ke daftar pengajuan simulasi.'),const SizedBox(height:12),
 ElevatedButton.icon(onPressed:_mengirim?null:_ajukan,icon:_mengirim?const SizedBox(width:18,height:18,child:CircularProgressIndicator(strokeWidth:2)):const Icon(Icons.send),label:Text(_mengirim?'Mengirim...':'Ajukan Permohonan')),
 OutlinedButton(onPressed:_mengirim?null:()=>Navigator.pop(context),child:const Text('Kembali')),
 ]));
}
