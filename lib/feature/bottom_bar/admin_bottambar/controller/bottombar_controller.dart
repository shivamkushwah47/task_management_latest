import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:task_management_app/core/widget/check_connectivity.dart';
import 'package:task_management_app/feature/admin_all_task/view/ALL_Task_view.dart';
import 'package:task_management_app/feature/admin_create_task/view/create_task_view.dart';
import 'package:task_management_app/feature/admin_home/view/home_page_view.dart';
import 'package:task_management_app/feature/admin_team_member/view/team_page_view.dart';
import 'package:task_management_app/feature/setting/view/setting_view.dart';

class BottomBarController extends GetxController {

  RxBool  checkConn = false.obs;
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  firstFunction()async{
    bool a = await checkConnectivity();
    checkConn.value = a;
  }


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
