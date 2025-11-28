import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final String label;

  const BadgeWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cs.primary.withOpacity(.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.local_fire_department,
              size: 24, color: cs.onSecondaryContainer),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }
}
