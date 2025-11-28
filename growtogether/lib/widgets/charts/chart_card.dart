
import 'package:flutter/material.dart';
import 'package:growtogether/models/daily_progress.dart';
import 'package:growtogether/models/weekly_progress.dart';
import 'package:growtogether/models/monthly_progress.dart';
import 'package:growtogether/models/exp_distribution.dart';
import 'package:growtogether/models/exp_stats.dart';

import 'package:growtogether/widgets/charts/daily_progress_chart.dart';
import 'package:growtogether/widgets/charts/exp_distribution_chart.dart';
import 'package:growtogether/widgets/charts/weekly_progress_chart.dart';
import 'package:growtogether/widgets/charts/monthly_progress_chart.dart';

class ChartCardsSection extends StatelessWidget {
  final DailyProgress daily;
  final WeeklyProgress weekly;
  final MonthlyProgress monthly;
  final ExpDistribution expDist;
  final ExpStats expStats;

  const ChartCardsSection({
    super.key,
    required this.daily,
    required this.weekly,
    required this.monthly,
    required this.expDist,
    required this.expStats,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Today's Progress", style: tt.titleLarge),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: DailyProgressChart(
                      you: daily.youSpots,
                      buddy: daily.buddySpots,
                    ),
                  ),
                ],
              ),
            ),
          ),


          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("This Week's Progress", style: tt.titleLarge),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: WeeklyProgressChart(
                      you: weekly.you.map((e) => e.toInt()).toList(),
                      buddy: weekly.buddy.map((e) => e.toInt()).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),


          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("This Month's Progress", style: tt.titleLarge),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: MonthlyProgressChart(values: monthly.values),
                  ),
                ],
              ),
            ),
          ),


          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("EXP Distribution", style: tt.titleLarge),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 180,
                    child: ExpDistributionChart(
                      meHours: expDist.you,
                      buddyHours: expDist.buddy,
                    ),
                  ),
                ],
              ),
            ),
          ),


          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Summary Stats", style: tt.titleLarge),
                  const SizedBox(height: 10),

                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 3,
                    ),
                    children: [
                      _buildStatTile(
                        icon: Icons.local_fire_department_outlined,
                        label: "Day Streak",
                        value: "${expStats.dayStreak} days",
                      ),
                      _buildStatTile(
                        icon: Icons.calendar_month_outlined,
                        label: "Total Days",
                        value: "${expStats.totalDays} days",
                      ),
                      _buildStatTile(
                        icon: Icons.timer_outlined,
                        label: "Daily Avg Hours",
                        value: "${expStats.dailyAverageHours}",
                      ),
                      _buildStatTile(
                        icon: Icons.access_time_outlined,
                        label: "Total Hours",
                        value: "${expStats.totalHours}",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.orange.shade50.withOpacity(0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 20, color: Colors.orange.shade700),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(label, style: const TextStyle(fontSize: 12)),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
