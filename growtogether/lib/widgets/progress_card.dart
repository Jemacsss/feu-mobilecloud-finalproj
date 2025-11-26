
import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress; // 0..1

  const ProgressCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: tt.titleLarge!.copyWith(fontSize: 18)),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 18,
                valueColor: AlwaysStoppedAnimation(cs.onPrimaryContainer),
                backgroundColor: cs.primaryContainer.withOpacity(.5),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('${(progress * 100).round()}%', style: tt.titleMedium),
                const SizedBox(width: 8),
                Expanded(child: Text(subtitle)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
