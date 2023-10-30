import 'package:flutter/material.dart';

class DarkModeProvider extends ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners(); // Notifica a los observadores que el estado ha cambiado
  }
}