class WeeklyProgress {
  final List<double> you;
  final List<double> buddy;

  WeeklyProgress({
    required this.you,
    required this.buddy,
  });

  factory WeeklyProgress.fromJson(Map<String, dynamic> json) {
    return WeeklyProgress(
      you: List<double>.from(json['you'].map((v) => v.toDouble())),
      buddy: List<double>.from(json['buddy'].map((v) => v.toDouble())),
    );
  }
}
