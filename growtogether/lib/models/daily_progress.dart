class DailyProgress {
  final List<double> you;
  final List<double> buddy;

  DailyProgress({
    required this.you,
    required this.buddy,
  });

  factory DailyProgress.fromJson(Map<String, dynamic> json) {
    return DailyProgress(
      you: List<double>.from(json['you'].map((v) => v.toDouble())),
      buddy: List<double>.from(json['buddy'].map((v) => v.toDouble())),
    );
  }
}
