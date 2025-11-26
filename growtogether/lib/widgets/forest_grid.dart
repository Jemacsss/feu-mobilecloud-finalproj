import 'package:flutter/material.dart';
import 'package:growtogether/models/award.dart';

class ForestGrid extends StatelessWidget {
  const ForestGrid({super.key, required this.awards});

  final List<Award> awards;

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
              color: _awardBoxColor(context),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: award.isUnlocked
                  ? _buildPlant(award.stage)
                  : const SizedBox(),
            ),
          );
        },
      ),
    );
  }

  // box color changes in light/dark mode
  Color _awardBoxColor(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return isLight ? Colors.brown[300]! : Colors.brown[700]!;
  }

  Widget _buildPlant(int stage) {
    switch (stage) {
      case 1:
        return Image.asset('images/awards/stage1.png', width: 26, height: 26);
      case 2:
        return Image.asset('images/awards/stage2.png', width: 26, height: 26);
      case 3:
        return Image.asset('images/awards/stage3.png', width: 26, height: 26);
      case 4:
        return Image.asset('images/awards/stage4.png', width: 26, height: 26);
      default:
        return const SizedBox();
    }
  }
}
