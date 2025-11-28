class WeeklyProgress {
  final List<double> you;
  final List<double> buddy;

  WeeklyProgress({
    required this.you,
    required this.buddy,
  });

  factory WeeklyProgress.fromJson(Map<String, dynamic> json) {
    return WeeklyProgress(
      you: (json["you"] as List).map((e) => (e as num).toDouble()).toList(),
      buddy: (json["buddy"] as List).map((e) => (e as num).toDouble()).toList(),
    );
  }
}
