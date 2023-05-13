import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:task_management_app/feature/admin_teammember_page/addnew_memner_page/controller/add_member_controller.dart';

class AddMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddMemberController());
  }
}
