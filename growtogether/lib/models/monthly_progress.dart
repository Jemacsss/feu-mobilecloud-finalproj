class MonthlyProgress {
  final double you;
  final double buddy;

  MonthlyProgress({
    required this.you,
    required this.buddy,
  });

  factory MonthlyProgress.fromJson(List<dynamic> json) {
    return MonthlyProgress(
      you: json[0].toDouble(),
      buddy: json[1].toDouble(),
    );
  }


  List<double> get values => [you, buddy];
}
