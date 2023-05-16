import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management_app/core/firebase/firebase.dart';
import 'package:task_management_app/core/routes.dart';

class AllTaskController extends GetxController {
  RxString selectedDate = "".obs;

  // var date = '${currDate.year}-${currDate.month}-${currDate.day}';

  // Stream<QuerySnapshot<Map<String, dynamic>>> allTaskSnapshota =
  // FirebaseFirestore.instance
  //     .collection("mytask/mytask/alltask").where("createDate", isEqualTo: selectedDate)
  //     .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> allTaskSnapshotu =
      FirebaseFirestore.instance
          .collection("mytask/mytask/alltask")
          .where("asignee", isEqualTo: FireBase.userInfo['name'])
          .snapshots();

  deleteUser(id, context) {
    print('id is' + id);
    AwesomeDialog(
      context: context,
      title: 'Warning',
      dialogType: DialogType.infoReverse,
      desc: 'Are you sure to delete your account',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        FireBase.deleteUser(FireBase.userInfo['id'], context);
      },
    ).show();
  }

  Logout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear().then((value) {
      Get.offAllNamed(Routes.login);
    });
  }

  @override
  void onInit() {
    super.onInit();
    selectedDate.value = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  }

}
