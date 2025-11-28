import 'package:flutter/material.dart';

class NoBuddyCard extends StatelessWidget {
  const NoBuddyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.secondaryContainer.withOpacity(.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          "No Buddy Linked",
          style: tt.titleLarge,
        ),
      ),
    );
  }
}
