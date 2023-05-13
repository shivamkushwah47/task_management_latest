import 'package:get/get.dart';
import 'package:task_management_app/feature/signup/controller/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}
