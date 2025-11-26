import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpDistributionChart extends StatelessWidget {
  final double meHours;
  final double buddyHours;

  const ExpDistributionChart({
    super.key,
    required this.meHours,
    required this.buddyHours,
  });

  @override
  Widget build(BuildContext context) {
    final total = meHours + buddyHours;
    final mePercent = total > 0 ? (meHours / total * 100) : 0;
    final buddyPercent = total > 0 ? (buddyHours / total * 100) : 0;

    return PieChart(
      PieChartData(
        sectionsSpace: 4,
        centerSpaceRadius: 30,
        sections: [
          PieChartSectionData(
            value: meHours,
            color: Colors.orange.shade600,
            title: '${mePercent.toStringAsFixed(1)}%\nYou',
            radius: 50,
            titleStyle: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            titlePositionPercentageOffset: 0.55,
          ),
          PieChartSectionData(
            value: buddyHours,
            color: Colors.orange.shade300,
            title: '${buddyPercent.toStringAsFixed(1)}%\nBuddy',
            radius: 50,
            titleStyle: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            titlePositionPercentageOffset: 0.55,
          ),
        ],
        pieTouchData: PieTouchData(enabled: true),
        borderData: FlBorderData(show: false),
      ),
      swapAnimationDuration: const Duration(milliseconds: 500),
      swapAnimationCurve: Curves.easeInOut,
    );
  }
}
