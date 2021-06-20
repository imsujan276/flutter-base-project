import 'package:flutter_base_project/app/constants/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CustomSnackBar {
  final String title;
  final String message;
  final Icon? icon;
  final SnackPosition? position;

  CustomSnackBar(
      {required this.title, required this.message, this.icon, this.position}) {
    Get.snackbar(
      "$title",
      "$message",
      icon: icon != null
          ? Icon(
              Icons.assignment_turned_in_outlined,
              color: Themes.WHITE,
            )
          : null,
      snackPosition: position ?? SnackPosition.BOTTOM,
      backgroundColor: Themes.GREY,
      colorText: Themes.WHITE,
    );
  }
}
