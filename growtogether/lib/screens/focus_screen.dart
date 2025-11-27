import 'dart:async';
import 'package:flutter/material.dart';
import 'package:growtogether/theme/timercolor.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  Timer? _timer;

  int _selectedMode = 0;

  final List<int> _durations = [25 * 60, 5 * 60, 15 * 60];

  final List<Color> _modeBackgrounds = [
    Timercolor.focusColor,
    Timercolor.shortBreakColor,
    Timercolor.longBreakColor,
  ];

  int _remainingSeconds = 25 * 60;
  bool _isRunning = false;

  void _selectMode(int mode) {
    setState(() {
      _selectedMode = mode;
      _remainingSeconds = _durations[mode];
      _isRunning = false;
    });

    _timer?.cancel();
  }

  void _startTimer() {
    if (_isRunning) return;

    _isRunning = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        _timer?.cancel();
        _isRunning = false;
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  String _formatTime(int seconds) {
    final min = (seconds ~/ 60).toString().padLeft(2, '0');
    final sec = (seconds % 60).toString().padLeft(2, '0');
    return "$min:$sec";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: _modeBackgrounds[_selectedMode], // PASTEL BG
      appBar: AppBar(
        title: const Text("Focus Timer"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _modeButton("Focus", 0),
              _modeButton("Short Break", 1),
              _modeButton("Long Break", 2),
            ],
          ),

          const SizedBox(height: 40),

          Text(
            _formatTime(_remainingSeconds),
            style: (text.displayMedium ?? const TextStyle()).copyWith(
              fontSize: 70,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 50),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _mainButton("Start", Colors.black87, Colors.white, _startTimer),
              const SizedBox(width: 20),
              _mainButton("Pause", Colors.white, Colors.black87, _pauseTimer),
            ],
          ),
        ],
      ),
    );
  }

  // Pastel mode selector buttons
  Widget _modeButton(String label, int index) {
    final bool selected = _selectedMode == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => _selectMode(index),
        selectedColor: Colors.black.withOpacity(0.8),
        backgroundColor: Colors.white70,
        labelStyle: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Main Start / Pause buttons
  Widget _mainButton(String text, Color bg, Color fg, VoidCallback action) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        foregroundColor: fg,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 4,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
