import 'package:get/get.dart';
import 'package:task_management_app/feature/Forgot_pass/controller/Forgot_controller.dart';
import 'package:task_management_app/feature/admin_AllTask_page/controller/All_Task_controller.dart';
import 'package:task_management_app/feature/admin_create_task/controller/create_task_controller.dart';
import 'package:task_management_app/feature/admin_home_page/controller/home_page-controller.dart';
import 'package:task_management_app/feature/bottambar/controller/bottombar_controller.dart';
import 'package:task_management_app/feature/register/Controller/register_cotroller.dart';

class BottombarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottombarController());
    Get.put(RegisterController());
    Get.put(ForgotController());
    Get.put(CreateTaskController());
    Get.put(AllTaskController());
    Get.lazyPut(() => HomePageController());
  }
}
