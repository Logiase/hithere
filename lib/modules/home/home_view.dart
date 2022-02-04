import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hithere/core/app_pages.dart';
import 'package:hithere/modules/home/drawer.dart';
import 'package:hithere/modules/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        final currentLocation = currentRoute?.location;

        return Scaffold(
          appBar: AppBar(),
          drawer: const AppDrawer(),
          body: GetRouterOutlet(
            initialRoute: AppRoutes.today,
            key: Get.nestedKey(AppRoutes.today),
          ),
        );
      },
    );
  }
}
