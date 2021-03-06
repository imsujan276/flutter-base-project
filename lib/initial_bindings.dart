import 'package:flutter_base_project/app/core/controllers/admob_controller.dart';
import 'package:flutter_base_project/app/core/services/internet_connectivity/internet_connectivity.dart';
import 'package:flutter_base_project/app/modules/home/controllers/home_controller.dart';
import 'package:get/instance_manager.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InternetConnectivityController(), permanent: true);
    Get.put(AdmobController(), permanent: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
