import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const _kThemeMode = 'themeMode';

  late SharedPreferences _preferences;
  bool _preferencesInited = false;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  void setThemeMode(ThemeMode value) {
    _themeMode = value;
    _save();
    notifyListeners();
  }

  String get themeModeString {
    switch (_themeMode) {
      case ThemeMode.system:
        return "System";
      case ThemeMode.light:
        return "Light";
      case ThemeMode.dark:
        return "Dark";
    }
  }

  ThemeProvider() {
    _load();
  }

  Future<void> _initPreferences() async {
    if (_preferencesInited) {
      return;
    }
    _preferences = await SharedPreferences.getInstance();
    _preferencesInited = true;
  }

  void _load() async {
    await _initPreferences();
    switch (_preferences.getInt(_kThemeMode) ?? 0) {
      case 0:
        _themeMode = ThemeMode.system;
        break;
      case 1:
        _themeMode = ThemeMode.light;
        break;
      case 2:
        _themeMode = ThemeMode.dark;
        break;
      default:
        _themeMode = ThemeMode.system;
        break;
    }
  }

  void _save() async {
    await _initPreferences();
    _preferences.setInt(_kThemeMode, _themeMode.index);
  }
}
