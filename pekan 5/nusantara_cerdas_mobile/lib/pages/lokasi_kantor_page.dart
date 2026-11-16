import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LokasiKantorPage extends StatelessWidget {
  const LokasiKantorPage({super.key});
  static const LatLng _pusat = LatLng(-6.200000, 106.816666);
  static final Set<Marker> _markers = {
    const Marker(markerId: MarkerId('pusat'), position: LatLng(-6.200000,106.816666),
      infoWindow: InfoWindow(title:'Kantor Layanan Pusat')),
    const Marker(markerId: MarkerId('utara'), position: LatLng(-6.170000,106.830000),
      infoWindow: InfoWindow(title:'Kantor Layanan Utara')),
    const Marker(markerId: MarkerId('selatan'), position: LatLng(-6.240000,106.810000),
      infoWindow: InfoWindow(title:'Kantor Layanan Selatan')),
  };
  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar:AppBar(title:const Text('Lokasi Kantor')),
    body:Column(children:[
      const Padding(padding:EdgeInsets.all(12),child:Text('Contoh titik kantor layanan. Ganti koordinat sesuai lokasi kantor sebenarnya.')),
      Expanded(child:GoogleMap(initialCameraPosition:const CameraPosition(target:_pusat,zoom:12),markers:_markers))
    ])
  );
}
