import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const ProfileHeader({
    super.key,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.eco, size: 50, color: colorScheme.onSecondaryContainer),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("grow", style: textTheme.titleLarge!.copyWith(fontSize: 24)),
            Text(
              "together",
              style: textTheme.titleLarge!.copyWith(
                fontSize: 24,
                color: colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
