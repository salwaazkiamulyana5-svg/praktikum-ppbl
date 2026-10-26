
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/kesiapsiagaan_model.dart';

class HalamanStatistikKesiapsiagaan extends StatelessWidget {
  const HalamanStatistikKesiapsiagaan({super.key});

  static const List<String> risiko = [
    'Gempa',
    'Tsunami',
    'Banjir',
  ];

  @override
  Widget build(BuildContext context) {
    final model = context.watch<KesiapsiagaanModel>();

    final List<int> values = risiko
        .map((jenisRisiko) => model.jumlahRisiko(jenisRisiko))
        .toList();

    final int jumlahMaksimum = values.fold<int>(
      0,
      (terbesar, nilai) => terbesar > nilai ? terbesar : nilai,
    );

    final double maxValue = (jumlahMaksimum + 2).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistik Kesiapsiagaan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total catatan: ${model.total}',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 24),

            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: maxValue,
                  alignment: BarChartAlignment.spaceAround,

                  barGroups: List.generate(
                    risiko.length,
                    (index) {
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: values[index].toDouble(),
                            width: 32,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      );
                    },
                  ),

                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final int index = value.toInt();

                          return SideTitleWidget(
                            meta: meta,
                            child: Text(
                              index >= 0 && index < risiko.length
                                  ? risiko[index]
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

            const SizedBox(height: 12),

            const Text(
              'Grafik diperbarui otomatis berdasarkan catatan '
              'kesiapsiagaan yang tersimpan.',
            ),
          ],
        ),
      ),
    );
  }
}
