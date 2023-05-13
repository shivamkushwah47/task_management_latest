import 'package:get/get.dart';
import 'package:task_management_app/feature/google_register/controller/google_register_controller.dart';

class GoogleRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GoogleRegisterController());
  }
}
