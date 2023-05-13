import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:task_management_app/feature/admin_create_task/controller/create_task_controller.dart';

class CreateTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateTaskController());
  }
}
