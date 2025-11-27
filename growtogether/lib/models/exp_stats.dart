class ExpStats {
  final int dayStreak;
  final int totalDays;
  final double dailyAverageHours;
  final double totalHours;

  ExpStats({
    required this.dayStreak,
    required this.totalDays,
    required this.dailyAverageHours,
    required this.totalHours,
  });

  factory ExpStats.fromJson(Map<String, dynamic> json) {
    return ExpStats(
      dayStreak: json['dayStreak'],
      totalDays: json['totalDays'],
      dailyAverageHours: json['dailyAverageHours'].toDouble(),
      totalHours: json['totalHours'].toDouble(),
    );
  }
}
