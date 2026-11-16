import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/favorit_cubit.dart';
import 'cubit/pengajuan_cubit.dart';
import 'navigation/app_routes.dart';

void main() => runApp(MultiBlocProvider(providers: [
  BlocProvider(create: (_) => FavoritCubit()),
  BlocProvider(create: (_) => PengajuanCubit()),
], child: const AplikasiNavigasi()));

class AplikasiNavigasi extends StatelessWidget {
  const AplikasiNavigasi({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Nusantara Cerdas Mobile', debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
    initialRoute: AppRoutes.beranda, routes: AppRoutes.daftarRoute(),
    onGenerateRoute: AppRoutes.bentukRoute, onUnknownRoute: AppRoutes.routeTidakDikenal,
  );
}
