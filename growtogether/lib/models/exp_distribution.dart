class ExpDistribution {
  final double you;
  final double buddy;

  ExpDistribution({
    required this.you,
    required this.buddy,
  });

  factory ExpDistribution.fromJson(Map<String, dynamic> json) {
    return ExpDistribution(
      you: json['you'].toDouble(),
      buddy: json['buddy'].toDouble(),
    );
  }
}
