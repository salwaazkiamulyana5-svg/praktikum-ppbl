
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/kesiapsiagaan_cubit.dart';
import '../model/kesiapsiagaan_model.dart';

class HalamanStatistikKesiapsiagaan extends StatelessWidget {
  const HalamanStatistikKesiapsiagaan({super.key});

  static const risiko = ['Gempa', 'Tsunami', 'Banjir'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KesiapsiagaanCubit, List<CatatanKesiapsiagaan>>(
      builder: (context, catatan) {
        final values = risiko
            .map((r) => catatan.where((e) => e.risiko == r).length)
            .toList();

        final maxValue = (
          values.fold<int>(0, (a, b) => a > b ? a : b) + 2
        ).toDouble();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Statistik Kesiapsiagaan'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Total catatan: ${catatan.length}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 24),

                Expanded(
                  child: BarChart(
                    BarChartData(
                      maxY: maxValue,
                      barGroups: List.generate(
                        risiko.length,
                        (i) => BarChartGroupData(
                          x: i,
                          barRods: [
                            BarChartRodData(
                              toY: values[i].toDouble(),
                              width: 32,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ],
                        ),
                      ),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (v, meta) {
                              final i = v.toInt();

                              return SideTitleWidget(
                                meta: meta,
                                space: 8,
                                child: Text(
                                  i >= 0 && i < risiko.length
                                      ? risiko[i]
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
                      borderData: FlBorderData(show: false),
                      gridData: const FlGridData(show: true),
                    ),
                  ),
                ),

                const Text(
                  'Grafik diperbarui otomatis dari data Cubit.',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
