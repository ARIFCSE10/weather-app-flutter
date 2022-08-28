import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  runApp(
    GetMaterialApp(
      title: "Weather",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
