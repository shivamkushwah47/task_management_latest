import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:task_management_app/core/global/colors.dart';
import 'package:task_management_app/core/widget/snack_bar.dart';
import 'package:task_management_app/feature/admin_all_task/view/ALL_Task_view.dart';
import 'package:task_management_app/feature/admin_create_task/view/create_task_view.dart';
import 'package:task_management_app/feature/admin_home/view/home_page_view.dart';
import 'package:task_management_app/feature/admin_team_member/view/team_page_view.dart';
import 'package:task_management_app/feature/bottom_bar/admin_bottambar/controller/bottombar_controller.dart';
import 'package:task_management_app/feature/setting/view/setting_view.dart';

class BottombarView extends GetView<BottomBarController> {
  BottombarView({super.key});
  RxBool returnValue = true.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  WillPopScope(
      onWillPop: () async {
         return true;
      },
      child: PersistentTabView(
        context,
        navBarHeight: 65,
        screens: controller.checkConn.value?_buildScreens():_buildScreensNetOff(),
        controller: controller.controller,
        items: _navBarsItems(),
        confineInSafeArea: true,
        stateManagement: false,

        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
               BoxShadow(
                color:  Color(0xffefefef),
                offset: Offset(
                  0.0,
                  -5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: -5.0,
              ), //
            ]),
        popAllScreensOnTapOfSelectedTab: false,
        popActionScreens: PopActionScreensType.all,
        navBarStyle: NavBarStyle.style15,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 100),
          curve: Curves.easeOut,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          duration: Duration(milliseconds: 5000),
        ),
        onItemSelected: (value) async {
          await controller.firstFunction();
          if(controller.checkConn.value==false){
            DoNotify.alertMsg("InternetConnectionNotFoundText".tr,);
          }else{
            if (value.toString() == '0') {

              // controller.getUserInfo();
            } else if (value.toString() == '3') {

            } else if (value.toString() == '4') {
              // controller.callSettingController();
            }else if (value.toString() == '1') {
              // controller.callReportController();
            }else if (value.toString() == '2') {
              // controller.callAddonController();
            }
          }
        },

      ),
    ));
  }
}



List<Widget> _buildScreens() {

  return [
    HomePageView(),
    AllTaskView(),
    CreateTaskView(),
    TeamView(),
    SettingView(),
  ];
}

List<Widget> _buildScreensNetOff() {

  return [
    HomePageView(),
    HomePageView(),
    HomePageView(),
    HomePageView(),
    HomePageView(),
  ];
}


List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: ("Home"),
      activeColorPrimary: GlobalColor.customMaterialColor,
      inactiveColorPrimary: Color(0xff9F9F9F),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.calendar_month),
      title: ("Calendar"),
      activeColorPrimary: GlobalColor.customMaterialColor,
      inactiveColorPrimary: Color(0xff9F9F9F),
    ),
    PersistentBottomNavBarItem(
      icon: Container(
        width: 80,
        height: 80,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 0.0),
              colors: [GlobalColor.customMaterialColor, Colors.indigo]),
        ),
        child: Padding(
          padding:  EdgeInsets.all(12.0),
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
      activeColorPrimary: Colors.transparent,
      inactiveColorPrimary: Colors.transparent,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.people_sharp),
      title: ("Team"),
      activeColorPrimary: GlobalColor.customMaterialColor,
      inactiveColorPrimary: Color(0xff9F9F9F),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.settings),
      title: ("Settings"),
      activeColorPrimary: GlobalColor.customMaterialColor,
      inactiveColorPrimary: Color(0xff9F9F9F),
    ),
  ];
}










// Scaffold(
//   backgroundColor: Colors.white,
//   body: controller.AdminalPages[controller.selectedindex.value],
//   bottomNavigationBar: ConvexAppBar(
//       // style: TabStyle.fixed,
//       style: TabStyle.fixedCircle,
//       backgroundColor: Colors.white,
//       color: Colors.grey.shade400,
//       activeColor: Colors.blue,
//       onTap: (value) {
//         controller.selectIndex(value);
//       },
//       items: const [
//         TabItem(
//           icon: Icons.home,
//         ),
//         TabItem(
//           icon: Icons.calendar_month,
//         ),
//         TabItem(
//           icon: Icons.add,
//         ),
//         TabItem(
//           icon: Icons.people,
//         ),
//         TabItem(
//           icon: Icons.settings,
//         )
//       ]),
// ),