import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:task_management_app/feature/admin_home_page/admin_done_page/controller/done_page_controller.dart';

class DoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DoneController());
  }
}
