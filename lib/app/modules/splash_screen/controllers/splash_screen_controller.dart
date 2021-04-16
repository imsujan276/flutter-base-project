import 'dart:async';

import 'package:blood_finder/app/core/services/storage_service/shared_preference.dart';
import 'package:blood_finder/app/data/enum/enum.dart';
import 'package:blood_finder/app/modules/home/views/home_view.dart';
import 'package:blood_finder/app/utils/app_info.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final int splashDelay = 500; // time in seconds
  final String versionCode =
      AppInfo.packageInfo.version; // returns app version code
  SharedPref pref = SharedPref.instance;

  @override
  void onInit() {
    super.onInit();
  }

  /// set the delay timer for splashscreen
  loadWidget() async {
    var _duration = Duration(milliseconds: splashDelay);
    return Timer(_duration, nextPage);
  }

  /// put the internet connectivity controller in memory and navigate to home as root
  void nextPage() async {
    String token = await pref.read(SHARED_DATA.TOKEN.toString());
    if (token == null) {
      Get.off(
        () => HomeView(),
        // () => AuthView(),
        transition: Transition.native,
      );
    } else {
      Get.off(
        () => HomeView(),
        transition: Transition.native,
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
