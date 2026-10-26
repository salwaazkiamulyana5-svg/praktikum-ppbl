import 'package:flutter/material.dart';
import '../pages/halaman_detail.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detail = '/detail';
  // Sengaja tidak didaftarkan untuk menguji onUnknownRoute.
  static const String ujiSalah = '/salah';
  
  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
    };
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == detail) {
      final argumen = settings.arguments as Map<String, String>? ?? const {};
      return MaterialPageRoute<String>(
        settings: settings,
        builder: (context) => HalamanDetail(
          judul: argumen['judul'] ?? 'Tanpa Judul',
          keterangan: argumen['keterangan'] ?? 'Tidak ada keterangan.',
        ),
      );
    }
    return null;
  }

  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Route Tidak Ditemukan')),
        body: Center(
          child: Text('Route ${settings.name} belum terdaftar.'),
        ),
      ),
    );
  }
}
