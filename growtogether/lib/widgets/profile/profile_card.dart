import 'package:flutter/material.dart';
import 'badge_widget.dart';
import 'achievement_badge.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String avatar;
  final String name;
  final String level;
  final String course;
  final int streak;
  final String achievement;
  final String achievementIcon;
  final double xp;
  final String buttonText;

  const ProfileCard({
    super.key,
    required this.title,
    required this.avatar,
    required this.name,
    required this.level,
    required this.course,
    required this.streak,
    required this.achievement,
    required this.achievementIcon,
    required this.xp,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.secondaryContainer.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: tt.titleLarge!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              // Avatar
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage(avatar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: tt.titleLarge!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(level, style: tt.titleMedium),
                  Text(
                    course,
                    style: tt.titleMedium!.copyWith(
                      fontSize: 12,
                      color: cs.onSecondaryContainer.withOpacity(.7),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              BadgeWidget(label: "$streak Day Streak"),
              const SizedBox(width: 12),
              AchievementBadge(label: achievement, iconPath: achievementIcon),
              const Spacer(),
              Text(
                xp.toString(),
                style: tt.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
