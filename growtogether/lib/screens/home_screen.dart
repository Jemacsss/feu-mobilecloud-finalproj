import 'package:flutter/material.dart';
import 'package:growtogether/data/awards_data.dart';
import 'package:growtogether/models/award.dart';
import 'package:growtogether/widgets/charts/chart_card.dart';
import 'package:growtogether/widgets/forest_grid.dart';

import 'package:growtogether/widgets/progress_card.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback gotoProfile;

  const HomeScreen({super.key, required this.gotoProfile});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    final List<Award> equippedAwards = allAwards
        .where((a) => a.equipped == true)
        .toList();

    return Scaffold(
      backgroundColor: cs.primaryContainer,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: cs.secondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.eco, size: 36),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("grow", style: tt.titleLarge!.copyWith(fontSize: 20)),
                    Text(
                      "together",
                      style: tt.titleLarge!.copyWith(
                        fontSize: 20,
                        color: cs.onSecondaryContainer,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 18),

            // Forest card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Your Forest",
                        style: tt.titleLarge!.copyWith(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ForestGrid(awards: equippedAwards),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Level card with progress
            ProgressCard(
              title: "Level 3: Sprout",
              subtitle: "Reach Level 6 to become a Seedling!",
              progress: 0.25,
            ),

            const SizedBox(height: 12),

            // Action buttons
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Start A Session Now",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              side: BorderSide(
                                color: cs.onSecondaryContainer.withOpacity(
                                  0.12,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text("Ping Buddy"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              gotoProfile();
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              side: BorderSide(
                                color: cs.onSecondaryContainer.withOpacity(
                                  0.12,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text("Manage Profile"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Charts section
            ChartCardsSection(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
