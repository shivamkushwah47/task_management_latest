import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:task_management_app/core/components/loader.dart';
import 'package:task_management_app/core/firebase/firebase.dart';
import 'package:task_management_app/core/routes.dart';

class LoginController extends GetxController {
  final getStorage = GetStorage();
  late final phone = TextEditingController();
  final pass = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  bool isEmail(String input) => EmailValidator.validate(input);

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  bool validateStructure(String value) {
    String pattern = r'(?=.*?[#?!@$%^&*-])';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  RxBool autologin = false.obs;
  RxBool ispasshidden = true.obs;
  bool formSatus = true;
  var isPasswordHidden = true.obs;

  var email = '';
  var password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    autologin.value = true;
  }

  isValid(value, msg) {
    if (value == null || value.isEmpty) {
      return msg;
    }
    return null;
  }

  Future login(context, phone, pass) async {
    if (loginFormKey.currentState!.validate()) {
      print("form validated");
      Loader.showLoader(context);
      if (!(await InternetConnectionChecker().hasConnection)) {
        Get.back();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Warning!!',
          desc: 'Check internet connection',
        ).show();
      } else {
        Get.back();
        FireBase.getData(context, phone, pass);
      }
    }
  }

  forgotPassword(context) async {
    Loader.showLoader(context);
    if (!(await InternetConnectionChecker().hasConnection)) {
      Get.back();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        title: 'Warning!!',
        desc: 'Check internet connection',
      ).show();
    } else {
      Get.back();
      Get.toNamed(Routes.forgotpass);
    }
  }

  EmailPassSignout() {
    FirebaseAuth.instance.signOut().then((value) {
      print("Logout successfully");
    });
  }

  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var result = await _googleSignIn.signIn();
      if (result == null) {
        return;
      }
      final userData = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(finalResult);
      print("Values is");
      print("Result $result");
      print(result.displayName);
      print(result.email);
      print(result.photoUrl);

      Get.toNamed(Routes.register, arguments: result.email);
    } catch (error) {
      print("Error");
      print(error);
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }
}
