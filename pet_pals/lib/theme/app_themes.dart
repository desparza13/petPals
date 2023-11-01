import 'package:flutter/material.dart';
import 'package:pet_pals/theme/color_schemes.dart';

enum AppTheme {
  themeLight,
  themeDark
}

final appThemeData = {
  AppTheme.themeLight: ThemeData(
    useMaterial3: true,
    colorScheme: themeLightColorScheme,
    appBarTheme: const AppBarTheme(
      color: Color(0xFF8F4152),
      iconTheme: IconThemeData(
      color: Colors.white, // Color de los iconos en la barra de aplicación
    ),
    ),
    primaryTextTheme: TextTheme(
      labelLarge: TextStyle(
        color: Colors.white
      )
    ),
    cardColor: Colors.white
    
  ),
  AppTheme.themeDark: ThemeData(
    useMaterial3: true,
    colorScheme: themeDarkColorScheme,
    appBarTheme: const AppBarTheme(
      color: Color(0xFF955196),
      iconTheme: IconThemeData(
      color: Colors.white, // Color de los iconos en la barra de aplicación
    ),),
    cardColor: Color(0xFF444E86)
  ),
  
  
};
