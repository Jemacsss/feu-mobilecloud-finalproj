import 'package:flutter/material.dart';
import 'package:growtogether/sevices/user_service.dart';
import 'package:growtogether/widgets/profile/buddy_finder.dart';
import 'package:growtogether/widgets/profile/no_buddy_card.dart';
import 'package:growtogether/widgets/profile/profile_card.dart';
import 'package:growtogether/widgets/profile/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserService userService;

  Map<String, dynamic>? youData;
  Map<String, dynamic>? buddyData;

  int? yourStreak;
  double? yourXP;
  Map<String, dynamic>? yourAchievement;

  bool loading = true;

  @override
  void initState() {
    super.initState();

    final token = "YOUR_COGNITO_JWT_TOKEN";
    userService = UserService(token: token);

    loadData();
  }

  Future<void> loadData() async {
    try {
      final me = await userService.getMyProfile();
      final buddy = await userService.getBuddyProfile();
      final streak = await userService.getStreak();
      final xp = await userService.getXP();
      final achievement = await userService.getLatestAchievement();

      setState(() {
        youData = me;
        buddyData = buddy;
        yourStreak = streak;
        yourXP = xp;
        yourAchievement = achievement;
        loading = false;
      });
    } catch (e) {
      print("Error loading profile: $e");
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileHeader(textTheme: tt, colorScheme: cs),
                  const SizedBox(height: 30),

                  // YOU CARD
                  ProfileCard(
                    title: "YOU",
                    avatar: "assets/images/avatar_placeholder.png",
                    name: youData?["name"] ?? "Unknown",
                    level: youData?["levelTitle"] ?? "Level 1",
                    course: youData?["course"] ?? "No course",
                    streak: yourStreak ?? 0,
                    achievement: yourAchievement?["title"] ?? "",
                    achievementIcon:
                        yourAchievement?["iconPath"] ?? "assets/images/awards/seed.png",
                    xp: yourXP ?? 0.0,
                    buttonText: "Start a Session Now",
                  ),

                  const SizedBox(height: 20),

                  buddyData == null
                      ? const NoBuddyCard()
                      : ProfileCard(
                          title: "Buddy",
                          avatar: "assets/images/avatar_placeholder.png",
                          name: buddyData?["name"] ?? "Buddy",
                          level: buddyData?["statusText"] ?? "",
                          course: buddyData?["course"] ?? "",
                          streak: buddyData?["streak"] ?? 0,
                          achievement:
                              buddyData?["latestAchievement"]?["title"] ?? "",
                          achievementIcon:
                              buddyData?["latestAchievement"]?["iconPath"] ??
                                  "assets/images/awards/seed.png",
                          xp: buddyData?["xp"] ?? 0.0,
                          buttonText: "Send a Ping",
                        ),

                  const SizedBox(height: 30),

                  BuddyFinder(userService: userService),
                ],
              ),
            ),
    );
  }
}
