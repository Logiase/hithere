import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hithere/providers/settings/theme_provider.dart';
import 'package:provider/provider.dart';

class HitHereApp extends StatelessWidget {
  HitHereApp({Key? key, required this.routerDelegate}) : super(key: key);

  final RouterDelegate<Object> routerDelegate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
    );
  }
}
