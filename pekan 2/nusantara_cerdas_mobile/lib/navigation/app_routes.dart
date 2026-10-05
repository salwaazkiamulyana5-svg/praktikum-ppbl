import 'package:flutter/material.dart';
import '../pages/halaman_detail.dart';
import '../pages/halaman_pengaturan.dart';
import '../pages/halaman_tentang.dart';
import '../pages/halaman_keluar.dart';
import '../pages/halaman_masuk.dart';
import '../pages/halaman_riwayat.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detail = '/detail';
  static const String pengaturan = '/pengaturan';
  static const String tentang = '/tentang';
  static const String keluar = '/keluar';
  static const String masuk = '/masuk';
  static const String riwayat = '/riwayat';
  static const String ujiSalah = '/salah';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      pengaturan: (context) => const HalamanPengaturan(),
      tentang: (context) => const HalamanTentang(),
      keluar: (context) => const HalamanKeluar(),
      masuk: (context) => const HalamanMasuk(),
      riwayat: (context) => const HalamanRiwayat(),
    };
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == detail) {
      final data = settings.arguments;
      if (data is! Map<String, String> ||
          !['nama', 'dinas', 'jam', 'keterangan'].every(data.containsKey)) {
        return MaterialPageRoute<String>(
          settings: settings,
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('Data Tidak Lengkap')),
            body: const Center(child: Text('Buka rincian dari daftar layanan.')),
          ),
        );
      }
      return MaterialPageRoute<String>(
        settings: settings,
        builder: (context) => HalamanDetail(
          nama: data['nama']!,
          dinas: data['dinas']!,
          jam: data['jam']!,
          keterangan: data['keterangan']!,
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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Route ${settings.name} belum terdaftar.'),
          ),
        ),
      ),
    );
  }
}
