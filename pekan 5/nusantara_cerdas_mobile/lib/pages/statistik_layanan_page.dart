
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pengajuan_cubit.dart';
import '../model/pendaftar_model.dart';

class StatistikLayananPage extends StatelessWidget {
  const StatistikLayananPage({super.key});

  static const bidang = [
    'Administrasi',
    'Kependudukan',
    'Infrastruktur',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PengajuanCubit, List<Pengajuan>>(
      builder: (context, items) {
        final counts = bidang
            .map((b) => items.where((e) => e.bidang == b).length)
            .toList();

        final maxY = (counts.fold<int>(
          0,
          (a, b) => a > b ? a : b,
        ) + 2).toDouble();

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total pengajuan: ${items.length}',
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
                          getTitlesWidget: (v, meta) {
                            final i = v.toInt();

                            return SideTitleWidget(
                              meta: meta,
                              space: 8,
                              child: Text(
                                i >= 0 && i < bidang.length
                                    ? ['Admin', 'Warga', 'Infra'][i]
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
                        sideTitles: SideTitles(showTitles: false),
                      ),

                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),

                    borderData: FlBorderData(show: false),
                    gridData: const FlGridData(show: true),
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
        );
      },
    );
  }
}
