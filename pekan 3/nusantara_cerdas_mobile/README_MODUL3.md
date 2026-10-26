# Nusantara Cerdas Mobile — Modul III Bagian G Soal 1

Proyek ini melanjutkan proyek Modul II yang diberikan. Struktur navigasi dan named routes dipertahankan.

## Perubahan
- `lib/models/favorit_model.dart`: state layanan favorit dengan `ChangeNotifier`.
- `lib/models/pengajuan_model.dart`: state daftar pengajuan dan getter `totalPengajuan`.
- `lib/main.dart`: `MultiProvider` ditempatkan di atas `MaterialApp`.
- `lib/pages/halaman_layanan.dart`: ikon bintang pada tiap layanan menggunakan `context.watch` dan `context.read`.
- `lib/pages/halaman_warga.dart`: daftar favorit dan daftar pengajuan menggunakan `Consumer`.
- `lib/pages/halaman_detail.dart`: indikator pengiriman sementara dan pencegahan tombol ditekan berulang.
- `lib/navigation/kerangka_navigasi.dart`: badge jumlah pengajuan pada ikon tujuan Warga untuk navigasi layar sempit maupun lebar.
- `pubspec.yaml`: menambahkan dependency `provider`.

## Cara menjalankan
Dari folder proyek:
```bash
flutter pub get
flutter analyze
flutter run
```

## Catatan
- Pengajuan masih berupa simulasi lokal; tidak dikirim ke instansi.
- Jalankan `flutter pub get` untuk memperbarui `pubspec.lock` dengan paket Provider.
- Lingkungan penyusunan ini tidak menyediakan Flutter/Dart CLI, sehingga `flutter analyze` dan uji emulator belum dapat dijalankan di sini.
