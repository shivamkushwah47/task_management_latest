import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:task_management_app/feature/admin_home_page/admin_todo_pages/controller/todo_page_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TodoController());
  }
}
