//needs api

import 'package:flutter/material.dart';
import 'package:growtogether/sevices/auth_service.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback switchTheme;
  final void Function(String message) successRegister;
  final VoidCallback cancelRegister;

  const SignupScreen(
    this.switchTheme, {
    super.key,
    required this.successRegister,
    required this.cancelRegister,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();
  final authService = AuthService();

  String error = '';

  void register() async {
  if (nameCtrl.text.isEmpty ||
      emailCtrl.text.isEmpty ||
      passCtrl.text.isEmpty ||
      confirmCtrl.text.isEmpty) {
    setState(() => error = "Please fill all fields");
    return;
  }

  if (passCtrl.text != confirmCtrl.text) {
    setState(() => error = "Passwords do not match");
    return;
  }

  setState(() => error = '');

  try {
    final msg = await authService.register(
      name: nameCtrl.text.trim(),
      email: emailCtrl.text.trim(),
      password: passCtrl.text.trim(),
    );

    widget.successRegister(msg);
  } catch (e) {
    setState(() => error = e.toString().replaceFirst("Exception: ", ""));
  }
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ✨ MATCHING HERO TAG
                  Hero(
                    tag: "auth-logo",
                    child: Icon(
                      Icons.eco,
                      size: 80,
                      color: cs.onSecondaryContainer,
                    ),
                  ),

                  const SizedBox(height: 12),
                  Text(
                    "What is GrowTogether?",
                    style: tt.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: cs.onSecondaryContainer,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "GrowTogether is a collaborative productivity app for gamified focus and shared accountability, designed to help users build sustainable productivity habits through cooperation, motivation, and visible progress.\n\nBuild habits. Stay accountable. Grow together.",
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSecondaryContainer.withOpacity(0.8),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  Text(
                    "Create Your Account",
                    style: tt.titleLarge?.copyWith(fontSize: 22),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: nameCtrl,
                    decoration: const InputDecoration(labelText: "Full Name"),
                  ),
                  TextField(
                    controller: emailCtrl,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  TextField(
                    controller: passCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                  TextField(
                    controller: confirmCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
                    ),
                  ),

                  const SizedBox(height: 10),

                  if (error.isNotEmpty)
                    Text(error, style: const TextStyle(color: Colors.red)),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: register,
                    child: const Text("Sign Up"),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: widget.cancelRegister,
                    child: const Text("Back to Login"),
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
