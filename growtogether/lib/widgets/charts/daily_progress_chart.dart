import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DailyProgressChart extends StatelessWidget {
  final List<FlSpot> you;
  final List<FlSpot> buddy;

  const DailyProgressChart({
    super.key,
    required this.you,
    required this.buddy,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return LineChart(
      LineChartData(
        minY: 0,
        maxY: 15,
        lineTouchData: LineTouchData(enabled: false),
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 3,
          getDrawingHorizontalLine: (value) => FlLine(
            color: cs.onSecondaryContainer.withOpacity(0.15),
            dashArray: [6, 3],
            strokeWidth: 1,
          ),
        ),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: you,
            isCurved: true,
            color: Colors.orange.shade600,
            barWidth: 4,
            dotData: FlDotData(show: true),
          ),
          LineChartBarData(
            spots: buddy,
            isCurved: true,
            color: Colors.orange.shade300,
            barWidth: 4,
            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}
