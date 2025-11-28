import 'package:flutter/material.dart';
import 'package:growtogether/models/award.dart';
import 'package:growtogether/models/daily_progress.dart';
import 'package:growtogether/models/exp_distribution.dart';
import 'package:growtogether/models/exp_stats.dart';
import 'package:growtogether/models/monthly_progress.dart';
import 'package:growtogether/models/weekly_progress.dart';
import 'package:growtogether/sevices/award_service.dart';
import 'package:growtogether/sevices/level_service.dart';
import 'package:growtogether/sevices/progress_service.dart';
import 'package:growtogether/sevices/user_service.dart';
import 'package:growtogether/widgets/charts/chart_card.dart';
import 'package:growtogether/widgets/forest_grid.dart';
import 'package:growtogether/widgets/progress_card.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback gotoProfile;

  const HomeScreen({super.key, required this.gotoProfile});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AwardsService awardService;
  late ProgressService progressService;
  late UserService userService;

  // Data
  List<Award> equippedAwards = [];
  DailyProgress? daily;
  WeeklyProgress? weekly;
  MonthlyProgress? monthly;
  ExpDistribution? expDist;
  ExpStats? expStats;

  // Level
  double levelProgress = 0.0;
  String levelTitle = "";
  String nextLevelTitle = "";

  bool loading = true;

  @override
  void initState() {
    super.initState();

    final token = "YOUR_COGNITO_JWT_TOKEN_HERE";

    awardService = AwardsService();
    progressService = ProgressService();
    userService = UserService(token: token);

    loadHomeData();
  }

  Future<void> loadHomeData() async {
    try {
      // 1. Awards
      equippedAwards = awardService
          .getAllAwards()
          .where((a) => a.equipped == true)
          .toList();

      // 2. Progress data
      daily = await progressService.getTodayProgress();
      weekly = await progressService.getWeeklyProgress();
      monthly = await progressService.getMonthlyProgress();
      expDist = await progressService.getExpDistribution();
      expStats = await progressService.getExpStats();

      // 3. Level calculation
      final info = LevelService.getLevelInfo(expStats!.totalHours);
      levelTitle = info["title"];
      nextLevelTitle = info["nextTitle"];
      levelProgress = info["progress"];

      setState(() => loading = false);
    } catch (e) {
      print("Error loading HomeScreen data: $e");
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: cs.primaryContainer,
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // HEADER -----------------------------------------------------
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

                  // FOREST -----------------------------------------------------
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

                  // LEVEL -------------------------------------------------------
                  ProgressCard(
                    title: "$levelTitle (Level Progress)",
                    subtitle: "Next: $nextLevelTitle",
                    progress: levelProgress,
                  ),

                  const SizedBox(height: 12),

                  // ACTION BUTTONS ----------------------------------------------
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
                                  onPressed: () async {
                                    final ok = await userService.sendPing();
                                    if (ok) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text("Ping sent successfully!"),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text("Ping Buddy"),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: widget.gotoProfile,
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


                  ChartCardsSection(
                    daily: daily!,
                    weekly: weekly!,
                    monthly: monthly!,
                    expDist: expDist!,
                    expStats: expStats!,
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }
}
