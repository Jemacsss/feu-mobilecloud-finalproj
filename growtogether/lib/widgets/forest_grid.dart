import 'package:flutter/material.dart';
import 'package:growtogether/models/award.dart';

class ForestGrid extends StatelessWidget {
  final List<Award> awards;

  const ForestGrid({super.key, required this.awards});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: awards.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
        ),
        itemBuilder: (context, i) {
          final award = awards[i];

          return Container(
            decoration: BoxDecoration(
              color: award.equipped
                  ? Colors.green[200]
                  : _awardBoxColor(context),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: award.unlocked
                  ? Image.asset(award.iconPath, width: 28, height: 28)
                  : const SizedBox(),
            ),
          );
        },
      ),
    );
  }

  Color _awardBoxColor(BuildContext context) {
    final light = Theme.of(context).brightness == Brightness.light;
    return light ? Colors.brown[300]! : Colors.brown[700]!;
  }
}
