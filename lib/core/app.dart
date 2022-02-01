import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:hithere/core/locations.dart';

class HitHereApp extends StatelessWidget {
  HitHereApp({Key? key}) : super(key: key) {
    debugPrint('HitHereApp created');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: BeamerDelegate(locationBuilder: (routeInformation, _) {
        return RootLocation(routeInformation);
      }),
    );
  }
}
