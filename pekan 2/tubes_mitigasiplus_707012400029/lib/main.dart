import 'package:flutter/material.dart';
import 'navigation/app_routes.dart';

void main() {
  runApp(const AplikasiMitigasiPlus());
}

class AplikasiMitigasiPlus extends StatelessWidget {
  const AplikasiMitigasiPlus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mitigasi Plus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.beranda,
      routes: AppRoutes.daftarRoute(),
      onGenerateRoute: AppRoutes.bentukRoute,
      onUnknownRoute: AppRoutes.routeTidakDikenal,
    );
  }
}
