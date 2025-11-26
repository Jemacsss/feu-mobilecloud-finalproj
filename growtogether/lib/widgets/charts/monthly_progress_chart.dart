import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MonthlyProgressChart extends StatelessWidget {
  final List<double> values;

  const MonthlyProgressChart({
    super.key,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(values.length, (i) {
          return BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                width: 40,
                toY: values[i],
                gradient: LinearGradient(
                  colors: [
                    Colors.orange.shade600,
                    Colors.orange.shade300,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ],
          );
        }),
        maxY: values.reduce((a, b) => a > b ? a : b) + 40,
      ),
    );
  }
}
