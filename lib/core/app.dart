import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hithere/providers/settings/theme_settings.dart';
import 'package:provider/provider.dart';

class HitHereApp extends StatelessWidget {
  const HitHereApp({Key? key, required this.routerDelegate}) : super(key: key);

  final RouterDelegate<Object> routerDelegate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'HitHere',
      debugShowCheckedModeBanner: true,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      themeMode: Provider.of<ThemeSettings>(context).themeMode,
      darkTheme: ThemeData.dark(),
      theme: Provider.of<ThemeSettings>(context).theme,
    );
  }
}
