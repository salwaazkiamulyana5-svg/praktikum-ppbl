import 'package:flutter/foundation.dart';

class Pengajuan {
  final String id;
  final String nama;
  final String email;
  final String bidang;
  final String sesi;
  final DateTime dibuatPada;
  bool selesai;

  Pengajuan({
    required this.id,
    required this.nama,
    required this.email,
    required this.bidang,
    required this.sesi,
    required this.dibuatPada,
    this.selesai = false,
  });
}

class PendaftarModel extends ChangeNotifier {
  final List<Pengajuan> _daftar = [];
  List<Pengajuan> get daftar => List.unmodifiable(_daftar);

  void tambah(Pengajuan item) {
    _daftar.insert(0, item);
    notifyListeners();
  }

  void tandaiSelesai(String id) {
    Pengajuan? item;
    for (final pengajuan in _daftar) { if (pengajuan.id == id) { item = pengajuan; break; } }
    if (item == null) return;
    item.selesai = !item.selesai;
    notifyListeners();
  }

  int jumlahBidang(String bidang) => _daftar.where((e) => e.bidang == bidang).length;
  int get jumlah => _daftar.length;
}
