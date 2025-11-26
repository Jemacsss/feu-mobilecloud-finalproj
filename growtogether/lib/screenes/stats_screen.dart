import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Your Stats")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _statCard("Total Focus Hours", "42 hrs", text),
          _statCard("Total XP", "1,240 XP", text),
          _statCard("Best Streak", "12 days", text),
        ],
      ),
    );
  }

  Widget _statCard(String label, String value, TextTheme text) {
    return Card(
      child: ListTile(
        title: Text(label, style: text.titleMedium),
        trailing: Text(value, style: text.titleLarge!.copyWith(fontSize: 20)),
      ),
    );
  }
}
