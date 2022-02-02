import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier {
  static const _kThemeMode = 'themeMode';
  static const _kThemeIndex = 'themeIndex';

  static const Map<String, MaterialColor> mdColors = {
    '知乎蓝': Colors.blue,
    '草原绿': Colors.green,
    '青葱绿': Colors.lightGreen,
    '姨妈红': Colors.red,
    '伊藤橙': Colors.orange,
    '基佬紫': Colors.deepPurple,
    '胭脂粉': Colors.pink,
    '低调灰': Colors.grey,
    '水鸭青': Colors.teal,
    '古铜棕': Colors.brown,
  };

  late SharedPreferences _preferences;
  bool _preferencesInitialized = false;

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    _themeMode = value;
    _saveThemeMode();
    notifyListeners();
  }

  String _themeIndex = '知乎蓝';

  ThemeData get theme {
    return ThemeData(primarySwatch: mdColors[_themeIndex]);
  }

  void setTheme(String value) {
    _themeIndex = value;
    _saveThemeIndex();
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

  String get themeColorString {
    return _themeIndex;
  }

  ThemeSettings() {
    _load();
  }

  Future<void> _initPreferences() async {
    if (_preferencesInitialized) {
      return;
    }
    _preferences = await SharedPreferences.getInstance();
    _preferencesInitialized = true;
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

    switch (_preferences.getString(_kThemeIndex) ?? '知乎蓝') {
      case '知乎蓝':
        _themeIndex = '知乎蓝';
        break;
      case '草原绿':
        _themeIndex = '草原绿';
        break;
      case '青葱绿':
        _themeIndex = '青葱绿';
        break;
      case '姨妈红':
        _themeIndex = '姨妈红';
        break;
      case '伊藤橙':
        _themeIndex = '伊藤橙';
        break;
      case '基佬紫':
        _themeIndex = '基佬紫';
        break;
      case '胭脂粉':
        _themeIndex = '胭脂粉';
        break;
      case '低调灰':
        _themeIndex = '低调灰';
        break;
      case '水鸭青':
        _themeIndex = '水鸭青';
        break;
      case '古铜棕':
        _themeIndex = '古铜棕';
        break;
      default:
        _themeIndex = '知乎蓝';
        break;
    }
  }

  void _saveThemeMode() async {
    await _initPreferences();
    _preferences.setInt(_kThemeMode, _themeMode.index);
  }

  void _saveThemeIndex() async {
    await _initPreferences();
    _preferences.setString(_kThemeIndex, _themeIndex);
  }
}
