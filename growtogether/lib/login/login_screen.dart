//needs api

import 'package:flutter/material.dart';
import 'package:growtogether/models/user.dart';


class LoginScreen extends StatefulWidget {
  final VoidCallback switchTheme;
  final bool successfulRegistration;
  final String successMessage;
  final void Function(BaseAppUser user) goToHome;
  final VoidCallback goToRegister;

  const LoginScreen(
    this.switchTheme,
    this.successfulRegistration,
    this.successMessage, {
    super.key,
    required this.goToHome,
    required this.goToRegister,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  String error = '';

  void login() {
    if (emailCtrl.text.isEmpty || passwordCtrl.text.isEmpty) {
      setState(() => error = 'Please fill all fields');
      return;
    }

    widget.goToHome(
      BaseAppUser(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: "User",
        email: emailCtrl.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            color: cs.secondaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: "auth-logo",
                    child: Icon(
                      Icons.eco,
                      size: 80,
                      color: cs.onSecondaryContainer,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text("Welcome Back!",
                      style: tt.titleLarge?.copyWith(fontSize: 22)),

                  const SizedBox(height: 20),

                  if (widget.successfulRegistration)
                    Text(widget.successMessage,
                        style: const TextStyle(color: Colors.green)),

                  const SizedBox(height: 20),

                  TextField(
                    controller: emailCtrl,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  TextField(
                    controller: passwordCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                  ),

                  const SizedBox(height: 10),

                  if (error.isNotEmpty)
                    Text(error, style: const TextStyle(color: Colors.red)),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: login,
                    child: const Text("Login"),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: widget.goToRegister,
                    child: const Text("Create Account"),
                  ),

                  IconButton(
                    onPressed: widget.switchTheme,
                    icon: const Icon(Icons.brightness_6),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
