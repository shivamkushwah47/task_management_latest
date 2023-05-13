import 'package:get/get.dart';
import 'package:task_management_app/feature/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
