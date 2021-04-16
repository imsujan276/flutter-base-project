import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetConnectionModal {
  NoInternetConnectionModal() {
    Get.dialog(
      AlertDialog(
        title: Text('No Internet Connection!'),
        content: Container(
          height: 90.0,
          child: Column(
            children: [
              Icon(
                Icons.wifi_off_outlined,
                size: 30,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                  'Please make sure you are connected to the internet and its working.'),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
