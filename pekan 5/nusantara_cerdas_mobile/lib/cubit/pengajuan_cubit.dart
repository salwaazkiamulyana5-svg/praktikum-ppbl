import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/pendaftar_model.dart';

class PengajuanCubit extends Cubit<List<Pengajuan>> {
  PengajuanCubit() : super(const []);
  int get totalPengajuan => state.length;
  void tambah(Pengajuan item) => emit([item, ...state]);
  void tandaiSelesai(String id) => emit(state.map((e) => e.id == id ? e.copyWith(selesai: !e.selesai) : e).toList());
  int jumlahBidang(String bidang) => state.where((e) => e.bidang == bidang).length;
}
