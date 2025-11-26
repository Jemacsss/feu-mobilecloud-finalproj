import 'package:flutter/material.dart';

class ExpStatsSection extends StatelessWidget {
  final int dayStreak;
  final int totalDays;
  final double dailyAverageHours;
  final double totalHours;

  const ExpStatsSection({
    super.key,
    required this.dayStreak,
    required this.totalDays,
    required this.dailyAverageHours,
    required this.totalHours,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text("Statistics", style: tt.titleMedium),
        const SizedBox(height: 12),

        //Day Streak
        Card(
          child: ListTile(
            leading: const Icon(Icons.local_fire_department_outlined),
            title: const Text("Day Streak"),
            trailing: Text("$dayStreak days", style: tt.bodyLarge),
          ),
        ),

        // Total Days
        Card(
          child: ListTile(
            leading: const Icon(Icons.calendar_month_outlined),
            title: const Text("Total Days"),
            trailing: Text("$totalDays days", style: tt.bodyLarge),
          ),
        ),

        //  Daily Average Hours
        Card(
          child: ListTile(
            leading: const Icon(Icons.timer_outlined),
            title: const Text("Daily Average Hours"),
            trailing: Text(
              dailyAverageHours.toStringAsFixed(2),
              style: tt.bodyLarge,
            ),
          ),
        ),

        //Total Hours
        Card(
          child: ListTile(
            leading: const Icon(Icons.access_time_outlined),
            title: const Text("Total Hours"),
            trailing: Text(
              totalHours.toStringAsFixed(1),
              style: tt.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}
