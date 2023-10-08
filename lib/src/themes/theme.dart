import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  late ThemeData _currentTheme;

  bool get darkTheme => _darkTheme;

  bool get customTheme => _customTheme;

  ThemeData get currentTheme => _currentTheme;

  ThemeData thirdTheme = ThemeData.light().copyWith(
      primaryColorLight: Colors.white,
      colorScheme:
          const ColorScheme.dark().copyWith(secondary: const Color(0xff48A0EB)),
      scaffoldBackgroundColor: const Color(0xff16202B),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)));

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    if (value) {
      _currentTheme = thirdTheme;
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: // light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;

      case 2: // dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;

      case 3: // custom
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = thirdTheme;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
    }
  }
}
