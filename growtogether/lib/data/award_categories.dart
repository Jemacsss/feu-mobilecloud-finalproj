class AwardCategory {
  final String id;
  final String name;
  final String description;

  AwardCategory({
    required this.id,
    required this.name,
    required this.description,
  });
}

final List<AwardCategory> awardCategories = [
  AwardCategory(
      id: "personal",
      name: "Personal Timber Log",
      description: "Total Hours Milestones"),

  AwardCategory(
      id: "ecosystem",
      name: "Ecosystem Synergy",
      description: "Total Hours with Buddy Milestones"),

  AwardCategory(
      id: "endurance",
      name: "Endurance Vows",
      description: "Total Days with Buddy Milestones"),

  AwardCategory(
      id: "continuousFlow",
      name: "Continuous Flow",
      description: "Day Streak Milestones"),

  AwardCategory(
      id: "planting",
      name: "Planting Days",
      description: "Total Days Milestones"),

  AwardCategory(
      id: "growthCycle",
      name: "Growth Cycles",
      description: "Sessions Finished Milestones"),

  AwardCategory(
      id: "woodSignals",
      name: "Wood-wide Signals",
      description: "Buddy Ping Milestones"),

  AwardCategory(
      id: "productivity",
      name: "Productivity Bounty",
      description: "Tasks Completed Milestones"),

  AwardCategory(
      id: "initialBloom",
      name: "Initial Bloom",
      description: "First Milestone"),

  AwardCategory(
      id: "energy",
      name: "Celestial Energy",
      description: "Hour Achievements"),

  AwardCategory(
      id: "mutual",
      name: "Mutual Root",
      description: "Synchronized Studying Achievements"),

  AwardCategory(
      id: "bounty",
      name: "Continuous Bounty",
      description: "Tasks Achievements"),

  AwardCategory(
      id: "fauna",
      name: "Active Fauna",
      description: "Ping Achievements"),
];