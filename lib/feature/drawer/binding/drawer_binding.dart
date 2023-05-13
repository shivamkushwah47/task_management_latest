import 'package:get/get.dart';
import 'package:task_management_app/feature/drawer/controller/drawer_controller.dart';

class DrawerBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(DrawersController());
  }

}