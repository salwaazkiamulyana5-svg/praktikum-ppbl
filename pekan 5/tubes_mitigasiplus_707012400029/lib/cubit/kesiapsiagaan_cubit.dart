import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/kesiapsiagaan_model.dart';
class KesiapsiagaanCubit extends Cubit<List<CatatanKesiapsiagaan>> {
 KesiapsiagaanCubit() : super(const []);
 void tambah(CatatanKesiapsiagaan item) => emit([item, ...state]);
 int jumlahRisiko(String risiko) => state.where((e)=>e.risiko==risiko).length;
 int get total => state.length;
}
