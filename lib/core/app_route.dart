part of 'app_pages.dart';

abstract class AppRoutes {
  static const home = _Paths.home;

  static const today = _Paths.home + _Paths.today;
  static const schedule = _Paths.home + _Paths.schedule;

  static const settings = _Paths.settings;
}

abstract class _Paths {
  static const home = '/home';
  static const today = '/today';
  static const schedule = '/schedule';
  static const settings = '/settings';
}
