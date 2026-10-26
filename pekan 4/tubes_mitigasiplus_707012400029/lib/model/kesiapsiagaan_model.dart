import 'package:flutter/foundation.dart';

class CatatanKesiapsiagaan {
  final String nama;
  final String risiko;
  final bool punyaTasSiaga;
  final DateTime waktu;
  CatatanKesiapsiagaan({required this.nama, required this.risiko, required this.punyaTasSiaga, required this.waktu});
}

class KesiapsiagaanModel extends ChangeNotifier {
  final List<CatatanKesiapsiagaan> _catatan = [];
  List<CatatanKesiapsiagaan> get catatan => List.unmodifiable(_catatan);
  void tambah(CatatanKesiapsiagaan item) { _catatan.insert(0,item); notifyListeners(); }
  int jumlahRisiko(String risiko) => _catatan.where((e)=>e.risiko==risiko).length;
  int get total => _catatan.length;
}
