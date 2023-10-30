import 'package:flutter/material.dart';
import 'package:pet_pals/theme/color_schemes.dart';

enum AppTheme {
  themeLight,
  themeDark
}

final appThemeData = {
  AppTheme.themeLight: ThemeData(
    useMaterial3: true,
    colorScheme: themeLightColorScheme
  ),
  AppTheme.themeDark: ThemeData(
    useMaterial3: true,
    colorScheme: themeDarkColorScheme
  ),
  
  
};
