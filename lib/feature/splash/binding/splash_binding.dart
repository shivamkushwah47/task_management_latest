import 'package:get/get.dart';
import 'package:task_management_app/feature/Introduction/controller/introduction_controller.dart';
import 'package:task_management_app/feature/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(IntroController());
  }
}
