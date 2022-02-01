import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hithere/core/app.dart';
import 'package:hithere/core/locations.dart';
import 'package:hithere/providers/settings/settings_provider.dart';
import 'package:hithere/providers/settings/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  FlutterNativeSplash.removeAfter((context) async {});

  final routerDelegate = BeamerDelegate(
    locationBuilder: (routeInformation, _) {
      return RootLocation(routeInformation);
    },
    initialPath: '/home',
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: HitHereApp(
      routerDelegate: routerDelegate,
    ),
  ));
}
