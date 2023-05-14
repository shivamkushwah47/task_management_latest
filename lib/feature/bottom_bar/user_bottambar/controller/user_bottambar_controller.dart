import 'package:get/get.dart';
import 'package:task_management_app/feature/admin_all_task/view/ALL_Task_view.dart';
import 'package:task_management_app/feature/admin_create_task/view/create_task_view.dart';
import 'package:task_management_app/feature/admin_home/view/home_page_view.dart';
import 'package:task_management_app/feature/admin_notification/view/admin_notification_view.dart';
import 'package:task_management_app/feature/setting/view/setting_view.dart';

class UserBottomBarController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(var _index) {
    print(_index);
    currentIndex.value = _index;
  }

  RxInt selectedindex = 0.obs;

  selectIndex(value) {
    selectedindex.value = value;
  }

  List AdminalPages = [
    HomePageView(),
    AllTaskView(),
    CreateTaskView(),
    NotificationView(),
    SettingView(),
  ];
}