import 'package:flutter/foundation.dart';

/// Menyimpan nama layanan yang ditandai sebagai favorit.
class FavoritModel extends ChangeNotifier {
  final Set<String> _layananFavorit = <String>{};

  Set<String> get layananFavorit => Set.unmodifiable(_layananFavorit);

  bool isFavorit(String namaLayanan) => _layananFavorit.contains(namaLayanan);

  void tandai(String namaLayanan) {
    if (_layananFavorit.add(namaLayanan)) {
      notifyListeners();
    }
  }

  void batalTandai(String namaLayanan) {
    if (_layananFavorit.remove(namaLayanan)) {
      notifyListeners();
    }
  }

  void toggle(String namaLayanan) {
    if (isFavorit(namaLayanan)) {
      batalTandai(namaLayanan);
    } else {
      tandai(namaLayanan);
    }
  }
}
