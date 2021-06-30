import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_base_project/app/constants/controllers.dart';
import 'package:flutter_base_project/app/core/services/storage_service/shared_preference.dart';
import 'package:flutter_base_project/app/modules/home/views/home_view.dart';
import 'package:flutter_base_project/app/utils/app_info.dart';
import 'package:flutter_base_project/app/utils/device_info.dart';
import 'package:get/get.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

class SplashScreenController extends GetxController {
  final int splashDelay = 500; // time in seconds
  final String versionCode =
      AppInfo.packageInfo.version; // returns app version code
  SharedPref pref = SharedPref.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  /// set the delay timer for splashscreen
  loadWidget() async {
    var _duration = Duration(milliseconds: splashDelay);
    return Timer(_duration, nextPage);
  }

  /// navigate to home as root
  void nextPage() async {
    Get.off(
      () => HomeView(),
      transition: Transition.native,
    );
  }
}
