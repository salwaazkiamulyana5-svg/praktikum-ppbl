import 'package:flutter/foundation.dart';

/// Menyimpan daftar layanan yang sedang diajukan oleh warga.
class PengajuanModel extends ChangeNotifier {
  final List<Map<String, String>> _daftarPengajuan = [];

  List<Map<String, String>> get daftarPengajuan =>
      List.unmodifiable(_daftarPengajuan);

  int get totalPengajuan => _daftarPengajuan.length;

  void tambah(Map<String, String> layanan) {
    _daftarPengajuan.add(Map<String, String>.unmodifiable(layanan));
    notifyListeners();
  }

  void hapus(String namaLayanan) {
    _daftarPengajuan.removeWhere((item) => item['nama'] == namaLayanan);
    notifyListeners();
  }

  void kosongkan() {
    if (_daftarPengajuan.isEmpty) return;
    _daftarPengajuan.clear();
    notifyListeners();
  }
}
