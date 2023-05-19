import 'package:get/get.dart';
import 'package:task_management_app/feature/Forgot_pass/controller/Forgot_controller.dart';
import 'package:task_management_app/feature/admin_all_task/controller/All_Task_controller.dart';
import 'package:task_management_app/feature/admin_create_task/controller/create_task_controller.dart';
import 'package:task_management_app/feature/admin_home/controller/home_page-controller.dart';
import 'package:task_management_app/feature/bottom_bar/admin_bottambar/controller/bottombar_controller.dart';
import 'package:task_management_app/feature/register/Controller/register_cotroller.dart';

class BottombarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomBarController());
    Get.put(RegisterController());
    Get.put(ForgotController());
    Get.put(CreateTaskController());
    Get.put(AllTaskController());
    Get.lazyPut(() => HomePageController());
  }
}
