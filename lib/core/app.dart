import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hithere/core/app_pages.dart';
import 'package:hithere/lang/translation_service.dart';

class HitHereApp extends StatelessWidget {
  const HitHereApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: true,
      enableLog: true,
      title: 'AppName'.tr,
      getPages: AppPages.routes,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
