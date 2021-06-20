import 'package:flutter_base_project/app/widgets/modals/no_internet_connection_modal.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class InternetConnectivityController extends GetxController {
  RxBool isInternetConnected = true.obs;
  @override
  void onInit() async {
    /// checks the connectivity status initially
    updateConnectionStatus(await Connectivity().checkConnectivity());
    super.onInit();
  }

  @override
  void onReady() {
    /// listens to the connectivity change and update the status
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      updateConnectionStatus(result);
    });
    super.onReady();
  }

  @override
  void onClose() {}

  /// Updates the connection status and show dialog on no connection
  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    Get.log("Connectivity Status => ${result.toString()}");
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        isInternetConnected.value = true;
        Get.back();
        break;
      case ConnectivityResult.none:
      default:
        isInternetConnected.value = false;
        NoInternetConnectionModal();
        break;
    }
  }
}
