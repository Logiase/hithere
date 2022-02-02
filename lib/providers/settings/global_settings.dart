import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalSettings extends ChangeNotifier {
  static const String _kCurrentSemester = 'current_semester';
  static const String _kCurrentWeek = 'current_week';

  late SharedPreferences _prefs;

  bool _prefsInitialized = false;

  GlobalSettings() {
    _load();
  }

  String _currentSemester = '';
  int _currentWeek = 1;

  Future<void> _initPreferences() async {
    if (!_prefsInitialized) {
      _prefs = await SharedPreferences.getInstance();
      _prefsInitialized = true;
    }
  }

  void _load() async {
    await _initPreferences();
    _currentSemester = _prefs.getString(_kCurrentSemester) ?? '';
    _currentWeek = _prefs.getInt(_kCurrentWeek) ?? 1;
  }

  void _save() async {
    await _initPreferences();
    _prefs.setString(_kCurrentSemester, _currentSemester);
    _prefs.setInt(_kCurrentWeek, _currentWeek);
  }
}
