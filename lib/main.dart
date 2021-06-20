import 'package:flutter_base_project/app/constants/constants.dart';
import 'package:flutter_base_project/app/constants/theme_data.dart';
import 'package:flutter_base_project/initial_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: Themes.light,
      darkTheme: Themes.dark,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.native,
      builder: EasyLoading.init(),
      initialBinding: InitialBinding(),
    ),
  );
}
