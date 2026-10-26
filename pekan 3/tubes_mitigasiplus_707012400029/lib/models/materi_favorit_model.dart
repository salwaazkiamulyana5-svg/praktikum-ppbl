import 'package:flutter/foundation.dart';

/// State bersama untuk materi mitigasi yang disimpan pengguna.
class MateriFavoritModel extends ChangeNotifier {
  final Set<String> _materiTersimpan = <String>{};

  Set<String> get materiTersimpan => Set.unmodifiable(_materiTersimpan);
  int get jumlahMateriTersimpan => _materiTersimpan.length;

  bool isTersimpan(String judul) => _materiTersimpan.contains(judul);

  void toggle(String judul) {
    if (!_materiTersimpan.add(judul)) {
      _materiTersimpan.remove(judul);
    }
    notifyListeners();
  }
}
