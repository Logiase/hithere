import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hithere/core/app.dart';
import 'package:hithere/core/locations.dart';
import 'package:hithere/data/course_repository.dart';
import 'package:hithere/data/course_service.dart';
import 'package:hithere/providers/course_provider.dart';
import 'package:hithere/providers/settings/global_settings.dart';
import 'package:hithere/providers/settings/theme_settings.dart';
import 'package:provider/provider.dart';

void main() {
  CourseRepository courseRepository = CourseRepository();

  FlutterNativeSplash.removeAfter((context) async {
    await courseRepository.open();
  });

  final routerDelegate = BeamerDelegate(
    locationBuilder: (routeInformation, _) {
      return RootLocation(routeInformation);
    },
    initialPath: '/home',
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GlobalSettings()),
      ChangeNotifierProvider(create: (_) => ThemeSettings()),
      ChangeNotifierProvider(
          create: (_) => CourseProvider(
              courseRepository: courseRepository,
              courseService: CourseService())),
    ],
    child: HitHereApp(
      routerDelegate: routerDelegate,
    ),
  ));
}
