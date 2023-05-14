import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task_management_app/core/components/loader.dart';
import 'package:task_management_app/core/components/snackbar.dart';
import 'package:task_management_app/core/firebase/firebase.dart';
import 'package:task_management_app/core/routes.dart';

class ForgotController extends GetxController {
  final getStorage = GetStorage();
  final GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phone = TextEditingController();
  static String verificationId = "";

  var phonevalue = '';

  RxBool autologin = false.obs;
  bool formSatus = true;

  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    // autologin.value = true;
  }

  isValid(value, msg) {
    if (value == null || value.isEmpty) {
      return msg;
    }
    return null;
  }

  ForgotPassword(context) async {
    if (forgetFormKey.currentState!.validate()) {
      print("form validated");
      print(phone.text);
      Loader.showLoader(context);
      if (!(await InternetConnectionChecker().hasConnection)) {
        Get.back();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Warning!!!',
          desc: 'Check internet connection',
        ).show();
      } else {
        Get.back();
        FireBase.checkUserByNum(phone.text).then((value) {
          if (FireBase.isPhoneExist) {
            print('the number is' + phone.text);
            print('phone exist');
            forget(context, phone.text);
          } else {
            const Snackbar(msg: 'Phone number not registered', title: 'Warning')
                .snack1();
          }
        });
      }
    }
  }

  forget(context, phone) async {
    Loader.showLoader(context);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${phone}",
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (FirebaseAuthException exception) {
          Get.back();
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: 'Error',
            desc: '${exception.message}',
          ).show();
          print("verificationFailed");
          Get.back();
        },
        codeSent: (verificationID, resendingToken) async {
          Get.back();
          print('This is $phone no.');
          verificationId = verificationID;
          Get.offNamed(Routes.ForgotOtp, arguments: [verificationID, phone]);
        },
        codeAutoRetrievalTimeout: (verificationID) async {});
  }
}
