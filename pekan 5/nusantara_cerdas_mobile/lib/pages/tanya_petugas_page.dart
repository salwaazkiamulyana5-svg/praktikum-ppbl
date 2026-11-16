import 'package:flutter/material.dart';

class TanyaPetugasPage extends StatefulWidget {
  const TanyaPetugasPage({super.key});
  @override
  State<TanyaPetugasPage> createState() => _TanyaPetugasPageState();
}
class _TanyaPetugasPageState extends State<TanyaPetugasPage> {
  final _controller = TextEditingController();
  final List<Map<String,dynamic>> _pesan = [
    {'teks':'Halo, ada yang bisa kami bantu?','warga':false},
  ];
  @override
  void dispose(){_controller.dispose();super.dispose();}
  void _kirim(){
    final teks=_controller.text.trim(); if(teks.isEmpty)return;
    setState((){_pesan.add({'teks':teks,'warga':true}); _controller.clear();});
    Future.delayed(const Duration(milliseconds:600),(){
      if(!mounted)return;
      setState(()=>_pesan.add({'teks':'Terima kasih. Pesan Anda telah diterima petugas.','warga':false}));
    });
  }
  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(title: const Text('Tanya Petugas')),
    body: Column(children:[
      Expanded(child:ListView.builder(padding:const EdgeInsets.all(12),itemCount:_pesan.length,itemBuilder:(c,i){
        final m=_pesan[i]; final warga=m['warga'] as bool;
        return Align(alignment:warga?Alignment.centerRight:Alignment.centerLeft,
          child:Container(margin:const EdgeInsets.symmetric(vertical:5),padding:const EdgeInsets.all(12),
            constraints:const BoxConstraints(maxWidth:300),
            decoration:BoxDecoration(color:warga?Colors.teal.shade100:Colors.grey.shade200,borderRadius:BorderRadius.circular(14)),
            child:Text(m['teks'] as String)));
      })),
      SafeArea(child:Padding(padding:const EdgeInsets.all(8),child:Row(children:[
        Expanded(child:TextField(controller:_controller,decoration:const InputDecoration(hintText:'Tulis pesan...',border:OutlineInputBorder()))),
        IconButton(onPressed:_kirim,icon:const Icon(Icons.send))
      ])))
    ])
  );
}
