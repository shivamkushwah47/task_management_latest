import 'package:get/get.dart';
import 'package:task_management_app/feature/admin_AllTask_page/view/ALL_Task_view.dart';
import 'package:task_management_app/feature/admin_create_task/view/create_task_view.dart';
import 'package:task_management_app/feature/admin_home_page/view/home_page_view.dart';
import 'package:task_management_app/feature/admin_teammember_page/view/team_page_view.dart';
import 'package:task_management_app/feature/setting/view/setting_view.dart';

class BottombarController extends GetxController {
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
    TeamView(),
    SettingView(),
  ];
}
