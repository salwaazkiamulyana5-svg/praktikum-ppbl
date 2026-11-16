class Pengajuan {
  const Pengajuan({required this.id, required this.nama, required this.email,
    required this.bidang, required this.sesi, required this.dibuatPada, this.selesai = false});
  final String id, nama, email, bidang, sesi;
  final DateTime dibuatPada;
  final bool selesai;
  Pengajuan copyWith({bool? selesai}) => Pengajuan(id:id,nama:nama,email:email,bidang:bidang,sesi:sesi,dibuatPada:dibuatPada,selesai:selesai??this.selesai);
}
