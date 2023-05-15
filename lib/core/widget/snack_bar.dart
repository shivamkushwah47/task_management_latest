import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/core/global/colors.dart';
class DoNotify {
  callSnack(waringType,msg,color,icon) {
    return Get.snackbar(
      waringType,
      msg,
      icon: icon,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
  successfulMsg(msg) {
    return Get.snackbar(
      "SuccessfulText".tr,
      msg,
      icon: const Icon(Icons.check, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: GlobalColor.customMaterialColor,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration:  Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
  static alertMsg(msg) {
    return Get.snackbar(
      "AlertText".tr,
      msg,
      icon: const Icon(Icons.warning_amber_outlined, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color(0xffff8212),
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration:  Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
  warningMsg(msg) {
    return Get.snackbar(
      "WarningText".tr,
      msg,
      icon:  const Icon(Icons.clear, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color(0xffEF5350),
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration:  Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

}