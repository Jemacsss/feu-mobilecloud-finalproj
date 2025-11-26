import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:growtogether/widgets/charts/daily_progress_chart.dart';
import 'package:growtogether/widgets/charts/exp_distribution_chart.dart';
import 'package:growtogether/widgets/charts/weekly_progress_chart.dart';
import 'package:growtogether/widgets/charts/monthly_progress_chart.dart';

class ChartCardsSection extends StatelessWidget {
  const ChartCardsSection({super.key});

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
                      you: [FlSpot(0, 1), FlSpot(5, 2), FlSpot(10, 3)],
                      buddy: [FlSpot(0, 1), FlSpot(5, 3), FlSpot(10, 4)],
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
                      you: [3, 4, 6, 5, 7, 8, 9],
                      buddy: [2, 3, 2, 4, 6, 7, 8],
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
                    child: MonthlyProgressChart(values: [160, 180]),
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
                    child: ExpDistributionChart(meHours: 12, buddyHours: 8),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Summary Stats", style: tt.titleLarge),
                  ),
                  const SizedBox(height: 10),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 3, // width/height ratio
                        ),
                    children: [
                      _buildStatTile(
                        icon: Icons.local_fire_department_outlined,
                        label: "Day Streak",
                        value: "14 days",
                      ),
                      _buildStatTile(
                        icon: Icons.calendar_month_outlined,
                        label: "Total Days",
                        value: "21 days",
                      ),
                      _buildStatTile(
                        icon: Icons.timer_outlined,
                        label: "Daily Avg Hours",
                        value: "2.3",
                      ),
                      _buildStatTile(
                        icon: Icons.access_time_outlined,
                        label: "Total Hours",
                        value: "48.5",
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
