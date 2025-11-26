import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: Text("Nickname", style: text.titleMedium),
            subtitle: Text("Name"),
          ),
          ListTile(
            leading: const Icon(Icons.public),
            title: Text("Timezone", style: text.titleMedium),
            subtitle: Text("GMT+8"),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text("Logout", style: text.titleMedium),
          ),
        ],
      ),
    );
  }
}
