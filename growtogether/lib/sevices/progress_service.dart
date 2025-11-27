import 'package:growtogether/models/daily_progress.dart';
import 'package:growtogether/models/weekly_progress.dart';
import 'package:growtogether/models/monthly_progress.dart';
import 'package:growtogether/models/exp_distribution.dart';
import 'package:growtogether/models/exp_stats.dart';

class ProgressService {
  Future<DailyProgress> getTodayProgress() async {
    return DailyProgress.fromJson({
      "you": [1, 2, 4, 6, 8],
      "buddy": [1, 3, 4, 6, 7],
    });
  }

  Future<WeeklyProgress> getWeeklyProgress() async {
    return WeeklyProgress.fromJson({
      "you": [3, 4, 6, 5, 7, 8, 9],
      "buddy": [2, 3, 2, 4, 6, 7, 8],
    });
  }

  Future<MonthlyProgress> getMonthlyProgress() async {
    return MonthlyProgress.fromJson([160, 180]);
  }

  Future<ExpDistribution> getExpDistribution() async {
    return ExpDistribution.fromJson({
      "you": 12,
      "buddy": 8,
    });
  }

  Future<ExpStats> getExpStats() async {
    return ExpStats.fromJson({
      "dayStreak": 14,
      "totalDays": 21,
      "dailyAverageHours": 2.3,
      "totalHours": 48.5,
    });
  }
}
