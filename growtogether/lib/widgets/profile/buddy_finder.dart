import 'package:flutter/material.dart';
import 'package:growtogether/sevices/user_service.dart';

class BuddyFinder extends StatefulWidget {
  final UserService userService;

  const BuddyFinder({super.key, required this.userService});

  @override
  State<BuddyFinder> createState() => _BuddyFinderState();
}

class _BuddyFinderState extends State<BuddyFinder> {
  final buddyCodeCtrl = TextEditingController();
  String? generatedCode;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.secondaryContainer.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            "Find a Buddy",
            style: tt.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Generate Code
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final code = await widget.userService.generateBuddyCode();
                setState(() => generatedCode = code);
              },
              child: const Text("Generate a Unique Code"),
            ),
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.brown.shade400,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                generatedCode ?? "Your Code Will Appear Here",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Enter buddy code
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.userService.linkBuddyCode(buddyCodeCtrl.text);
              },
              child: const Text("Enter Buddy’s Code"),
            ),
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.brown.shade400,
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextField(
              controller: buddyCodeCtrl,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Buddy’s Code Here",
                labelStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Random buddy
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.userService.randomBuddy();
              },
              child: const Text("Random Buddy"),
            ),
          ),
        ],
      ),
    );
  }
}
