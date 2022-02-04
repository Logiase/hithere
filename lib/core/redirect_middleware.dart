import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RedirectMiddleware extends GetMiddleware {
  final String current;
  final String path;

  RedirectMiddleware({required this.current, required this.path}) : super();

  @override
  RouteSettings? redirect(String? route) {
    if (route == current) {
      return RouteSettings(name: path);
    }
  }
}
