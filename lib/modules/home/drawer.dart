import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hithere/core/app_pages.dart';
import 'package:styled_widget/styled_widget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: const Text('Drawer Header').center()),
          ListTile(
            leading: const Icon(Icons.wb_sunny),
            title: const Text('Today'),
            onTap: () {
              Get.rootDelegate.toNamed(AppRoutes.today);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('schedule'),
            onTap: () {
              Get.rootDelegate.toNamed(AppRoutes.schedule);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Get.rootDelegate.toNamed(AppRoutes.settings);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
