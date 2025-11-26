import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WeeklyProgressChart extends StatelessWidget {
  final List<int> you;
  final List<int> buddy;

  const WeeklyProgressChart({
    super.key,
    required this.you,
    required this.buddy,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final days = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];

    return BarChart(
      BarChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final idx = value.toInt();
                if (idx < 0 || idx >= days.length) return const SizedBox();
                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    days[idx],
                    style: TextStyle(color: cs.onSecondaryContainer),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(7, (i) {
          return BarChartGroupData(
            x: i,
            barsSpace: 4,
            barRods: [
              BarChartRodData(
                toY: you[i].toDouble(),
                width: 14,
                gradient: LinearGradient(
                  colors: [Colors.orange.shade600, Colors.orange.shade300],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              BarChartRodData(
                toY: buddy[i].toDouble(),
                width: 14,
                color: Colors.orangeAccent.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ],
          );
        }),
        alignment: BarChartAlignment.spaceAround,
        maxY: 12,
      ),
    );
  }
} 
