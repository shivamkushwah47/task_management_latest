import 'package:get/get.dart';
import 'package:task_management_app/feature/reasy_to_task/controller/ready_task_controller.dart';

class ReadyToTaskBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ReadyToTaskController());
  }

}