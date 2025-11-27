import 'package:flutter/material.dart';

final Color defaultSeedColor = Colors.green;


final ColorScheme kColorScheme = ColorScheme.fromSeed(
  seedColor: defaultSeedColor,
);

final ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: defaultSeedColor,
  brightness: Brightness.dark,
);
