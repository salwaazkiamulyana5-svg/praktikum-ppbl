import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/kesiapsiagaan_cubit.dart';
import 'navigation/app_routes.dart';
void main() => runApp(BlocProvider(create: (_) => KesiapsiagaanCubit(), child: const AplikasiMitigasiPlus()));
class AplikasiMitigasiPlus extends StatelessWidget {
 const AplikasiMitigasiPlus({super.key});
 @override Widget build(BuildContext context) => MaterialApp(title:'Mitigasi Plus',debugShowCheckedModeBanner:false,
  theme:ThemeData(colorSchemeSeed:Colors.teal,useMaterial3:true),initialRoute:AppRoutes.beranda,
  routes:AppRoutes.daftarRoute(),onGenerateRoute:AppRoutes.bentukRoute,onUnknownRoute:AppRoutes.routeTidakDikenal);
}
