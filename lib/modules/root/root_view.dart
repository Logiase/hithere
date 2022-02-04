import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hithere/core/app_pages.dart';
import 'package:hithere/modules/root/root_controller.dart';
import 'package:styled_widget/styled_widget.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return GetRouterOutlet(
          initialRoute: AppRoutes.home,
          key: Get.nestedKey(AppRoutes.home),
        );
      },
    );
  }
}
