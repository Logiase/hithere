import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:hithere/core/app.dart';

void main() {
  FlutterNativeSplash.removeAfter((context) async {
  });

  runApp(HitHereApp());
}
