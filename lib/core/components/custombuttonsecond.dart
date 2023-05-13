import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/core/global/colors.dart';

class CustomButtonCancel extends GetView {
  final String title;
  final VoidCallback onPress;

  const CustomButtonCancel(
      {super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 1.5,color: Colors.blue),
          backgroundColor: Colors.white,
          shape: StadiumBorder(),
        ),
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: TextStyle(
              color: GlobalColor.blugrey,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              fontSize: Get.height * 0.02,
              //    fontFamily: CustomFonts.alata
            ),
          ),
        ),
      ),
    );
  }
}
