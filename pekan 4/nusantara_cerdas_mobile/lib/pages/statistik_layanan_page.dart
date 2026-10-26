
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/pendaftar_model.dart';

class StatistikLayananPage extends StatelessWidget {
  const StatistikLayananPage({super.key});

  static const List<String> bidang = [
    'Administrasi',
    'Kependudukan',
    'Infrastruktur',
  ];

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PendaftarModel>();
    final counts = bidang.map(model.jumlahBidang).toList();

    final int jumlahMaksimum = counts.fold<int>(
      0,
      (nilaiTerbesar, jumlah) =>
          nilaiTerbesar > jumlah ? nilaiTerbesar : jumlah,
    );

    final double maxY = (jumlahMaksimum + 2).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistik Layanan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total pengajuan: ${model.jumlah}',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 24),

            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: maxY,

                  barGroups: List.generate(
                    bidang.length,
                    (i) => BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: counts[i].toDouble(),
                          width: 30,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ],
                    ),
                  ),

                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final int index = value.toInt();

                          const List<String> labelBidang = [
                            'Admin',
                            'Warga',
                            'Infra',
                          ];

                          return SideTitleWidget(
                            meta: meta,
                            child: Text(
                              index >= 0 && index < labelBidang.length
                                  ? labelBidang[index]
                                  : '',
                            ),
                          );
                        },
                      ),
                    ),

                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                      ),
                    ),

                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),

                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                  ),

                  borderData: FlBorderData(
                    show: false,
                  ),

                  gridData: const FlGridData(
                    show: true,
                  ),
                ),
              ),
            ),

            ...List.generate(
              bidang.length,
              (i) => ListTile(
                dense: true,
                title: Text(bidang[i]),
                trailing: Text('${counts[i]} pengajuan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
