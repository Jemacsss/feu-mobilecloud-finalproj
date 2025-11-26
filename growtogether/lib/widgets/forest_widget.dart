import 'package:flutter/material.dart';

class ForestWidget extends StatelessWidget {
  const ForestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: colors.secondaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          "🌳 Shared Forest Visual\n(Placeholder)",
          textAlign: TextAlign.center,
          style: text.titleLarge!.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
