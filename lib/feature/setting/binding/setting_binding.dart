import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_management_app/feature/setting/controller/seting_controller.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SettingController());

  }
}