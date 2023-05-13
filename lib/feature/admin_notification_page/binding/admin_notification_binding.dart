import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:task_management_app/feature/admin_notification_page/controller/afdmin_notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
  }
}
