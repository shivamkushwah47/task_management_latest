import 'package:get/get.dart';
import 'package:task_management_app/feature/edit_create_task/Controller/edit_task_controller.dart';


class EditTaskBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(EditTaskController());
  }

}