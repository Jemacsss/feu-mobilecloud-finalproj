// lib/main.dart
import 'package:flutter/material.dart';
import 'package:growtogether/models/user.dart';
import 'package:growtogether/screens/awards_screen.dart';
import 'package:growtogether/screens/focus_screen.dart';
import 'package:growtogether/screens/home_screen.dart';
import 'package:growtogether/screens/profile_screen.dart';
import 'package:growtogether/login/login_screen.dart';
import 'package:growtogether/login/signup_screen.dart';
import 'package:growtogether/theme/light_theme.dart';
import 'package:growtogether/theme/dark_theme.dart';

void main() {
  runApp(const GrowTogetherApp());
}

class GrowTogetherApp extends StatefulWidget {
  const GrowTogetherApp({super.key});

  @override
  State<GrowTogetherApp> createState() => _GrowTogetherAppState();
}

class _GrowTogetherAppState extends State<GrowTogetherApp> {
  BaseAppUser? loginUser;
  bool isNewUser = false;
  bool successfulRegistration = false;
  String successMessage = '';
  ThemeMode themeMode = ThemeMode.light;
  int pageIndex = 0;

  late final pages = [
  HomeScreen(gotoProfile: () {
    setState(() => pageIndex = 3); 
  }),
  const FocusScreen(),
  const AwardsScreen(),
  const ProfileScreen(),
];

  void switchTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  void logout() {
    setState(() {
      loginUser = null;
    });
  }

  void goToHome(BaseAppUser user) {
    setState(() {
      loginUser = user;
    });
  }

  void goToRegister() {
    setState(() {
      isNewUser = true;
    });
  }

  void cancelRegister() {
    setState(() {
      isNewUser = false;
      successfulRegistration = false;
    });
  }

  void successRegister(String message) {
    setState(() {
      successMessage = message;
      successfulRegistration = true;
      isNewUser = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/profile':(context)=>ProfileScreen(),
      },
      title: 'GrowTogether',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Builder(
        builder: (context) {
          Widget content = LoginScreen(
            switchTheme,
            successfulRegistration,
            successMessage,
            goToHome: goToHome,
            goToRegister: goToRegister,
          );

          if (loginUser != null) {
            content = Scaffold(
              body: SafeArea(child: pages[pageIndex]),
              bottomNavigationBar: _buildBottomNav(context),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                onPressed: switchTheme,
                child: Icon(
                  themeMode == ThemeMode.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
              ),
            );
          } else if (isNewUser) {
            content = SignupScreen(
              switchTheme,
              successRegister: (String msg) => successRegister(msg),
              cancelRegister: cancelRegister,
            );
          }

          return content;
        },
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: cs.primaryContainer,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: cs.onPrimaryContainer.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home_outlined, 'Home', 0),
            _navItem(Icons.timer_outlined, 'Focus', 1),
            const SizedBox(width: 56), // for FAB
            _navItem(Icons.emoji_events_outlined, 'Awards', 2),
            _navItem(Icons.person_outline, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int idx) {
    final isSelected = idx == pageIndex;
    return GestureDetector(
      onTap: () => setState(() => pageIndex = idx),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.brown.shade700 : Colors.grey),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
