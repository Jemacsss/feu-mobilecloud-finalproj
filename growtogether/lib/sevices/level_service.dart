class LevelService {
  static const List<Map<String, dynamic>> levels = [
    {"level": 1, "title": "Seed", "hours": 0},
    {"level": 2, "title": "Sprout", "hours": 10},
    {"level": 3, "title": "Sapling", "hours": 25},
    {"level": 4, "title": "Young Tree", "hours": 50},
    {"level": 5, "title": "Mature Tree", "hours": 100},
    {"level": 6, "title": "Elder Tree", "hours": 200},
    {"level": 7, "title": "Ancient Forest Guardian", "hours": 400},
  ];

  static Map<String, dynamic> getLevelInfo(double totalHours) {
    for (int i = levels.length - 1; i >= 0; i--) {
      if (totalHours >= levels[i]["hours"]) {
        final current = levels[i];
        final next = i < levels.length - 1 ? levels[i + 1] : current;

        final progress = next["hours"] == current["hours"]
            ? 1.0
            : ((totalHours - current["hours"]) /
                    (next["hours"] - current["hours"]))
                .clamp(0.0, 1.0);

        return {
          "level": current["level"],
          "title": current["title"],
          "progress": progress,
          "nextTitle": next["title"]
        };
      }
    }

    return levels.first;
  }
}
