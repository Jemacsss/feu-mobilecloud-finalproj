import 'package:flutter/material.dart';

class AchievementBadge extends StatelessWidget {
  final String label;
  final String iconPath;

  const AchievementBadge({
    super.key,
    required this.label,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 24, height: 24),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }
}
