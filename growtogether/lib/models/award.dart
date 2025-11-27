// lib/models/award.dart

class Award {
  final String id;
  final String category;
  final String title;
  final String subtitle;
  final String iconPath;

  bool unlocked;
  bool equipped; 

  Award({
    required this.id,
    required this.category,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    this.unlocked = false,
    this.equipped = false,
  });

  Award copyWith({
    bool? unlocked,
    bool? equipped,
  }) {
    return Award(
      id: id,
      category: category,
      title: title,
      subtitle: subtitle,
      iconPath: iconPath,
      unlocked: unlocked ?? this.unlocked,
      equipped: equipped ?? this.equipped,
    );
  }
}
