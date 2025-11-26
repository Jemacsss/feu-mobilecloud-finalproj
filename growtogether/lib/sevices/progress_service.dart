class ProgressService {
  // TODO: Replace with real AWS call
  Future<Map<String, dynamic>> getTodayProgress() async {
    return {
      "you": [1, 2, 4, 6, 8],
      "buddy": [1, 3, 4, 6, 7]
    };
  }

  Future<Map<String, dynamic>> getWeeklyProgress() async {
    return {
      "you": [3, 4, 6, 5, 7, 8, 9],
      "buddy": [2, 3, 2, 4, 6, 7, 8]
    };
  }

  Future<List<double>> getMonthlyProgress() async {
    return [160, 180];
  }
}
