import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hithere/modules/home/home_binding.dart';
import 'package:hithere/modules/home/home_view.dart';
import 'package:hithere/modules/root/root_binding.dart';
import 'package:hithere/modules/root/root_view.dart';
import 'package:hithere/modules/schedule/schedule_binding.dart';
import 'package:hithere/modules/schedule/schedule_view.dart';
import 'package:styled_widget/styled_widget.dart';

part 'app_route.dart';

class AppPages {
  AppPages._();

  static final routes = <GetPage>[
    GetPage(
      name: '/',
      page: () => const RootView(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          preventDuplicates: true,
          name: _Paths.home,
          page: () => const HomeView(),
          binding: HomeBinding(),
          title: null,
          children: [
            GetPage(
              name: _Paths.today,
              page: () => const Text('Today').center(),
            ),
            GetPage(
              name: _Paths.schedule,
              page: () => const ScheduleView(),
              binding: ScheduleBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.settings,
          page: () => Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Get.rootDelegate.toNamed(AppRoutes.home),
              ),
            ),
            body: const Text('Settings'),
          ),
        ),
      ],
    ),
  ];
}
