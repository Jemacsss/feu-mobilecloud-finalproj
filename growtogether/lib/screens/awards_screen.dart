import 'package:flutter/material.dart';

import 'package:growtogether/models/award.dart';
import 'package:growtogether/sevices/award_service.dart';

class AwardsScreen extends StatelessWidget {
  const AwardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    final AwardsService service = AwardsService();
    final categories = service.getCategories();

    return Scaffold(
      backgroundColor: cs.primaryContainer,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cs.primaryContainer,
        title: Text(
          "Awards",
          style: tt.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
            color: cs.onPrimaryContainer,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          children: [
            for (final cat in categories) ...[
              _CategorySection(
                name: cat.name,
                description: cat.description,
                awards: service.getAwardsByCategory(cat.id),
              ),
              const SizedBox(height: 26),
            ],
          ],
        ),
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  final String name;
  final String description;
  final List<Award> awards;

  const _CategorySection({
    required this.name,
    required this.description,
    required this.awards,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: cs.secondaryContainer.withOpacity(0.45),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: tt.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: cs.onPrimaryContainer,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            description,
            style: tt.bodyMedium!.copyWith(
              fontSize: 13,
              color: cs.onPrimaryContainer.withOpacity(0.75),
            ),
          ),
          const SizedBox(height: 16),
          _AwardsGrid(awards: awards),
        ],
      ),
    );
  }
}

class _AwardsGrid extends StatelessWidget {
  final List<Award> awards;

  const _AwardsGrid({required this.awards});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: awards.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 110,
        childAspectRatio: 0.78,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, i) {
        final award = awards[i];
        final locked = !award.unlocked;

        return Column(
          children: [
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                color: locked ? Colors.brown[200] : Colors.brown[300],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Opacity(
                      opacity: locked ? 0.45 : 1.0,
                      child: Image.asset(award.iconPath),
                    ),
                  ),
                  if (locked)
                    const Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.lock, size: 22, color: Colors.black38),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              award.subtitle,
              style: TextStyle(
                fontSize: 11,
                height: 1.15,
                fontWeight: FontWeight.w500,
                color: cs.onPrimaryContainer,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
