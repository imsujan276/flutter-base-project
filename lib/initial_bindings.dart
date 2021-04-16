import 'package:blood_finder/app/core/services/internet_connectivity/internet_connectivity.dart';
import 'package:blood_finder/app/modules/home/controllers/home_controller.dart';
import 'package:get/instance_manager.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InternetConnectivityController(), permanent: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
