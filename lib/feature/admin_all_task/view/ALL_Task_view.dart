import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';
import 'package:task_management_app/core/firebase/firebase.dart';
import 'package:task_management_app/feature/admin_all_task/controller/All_Task_controller.dart';

class AllTaskView extends GetView<AllTaskController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
          appBar: CalendarAppBar(
            white: Colors.white,
            black: Colors.black,
            accent: Colors.blue,
            fullCalendar: false,
            selectedDate: DateTime.now(),
            onDateChanged: (value) {
               controller.selectedDate.value = DateFormat('yyyy-MM-dd').format(value).toString();
              print(controller.selectedDate);
            },
            firstDate: DateTime.now().subtract(Duration(days: 140)),
            lastDate: DateTime.now(),
            backButton: false,
          ),
          body: SafeArea(
            child: Column(
              children: [
                // SizedBox(
                //   height: 230,
                 /* child:*/
                // ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("All Task",
                          style: TextStyle(
                              fontSize: Get.height * 0.025,
                              fontWeight: FontWeight.bold)),
                      Text("Priority",
                          style: TextStyle(
                              fontSize: Get.height * 0.019,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                StreamBuilder(
                  stream: FireBase.userInfo['role'] == "admin" ? FirebaseFirestore.instance
                      .collection("mytask/mytask/alltask").where("createDate", isEqualTo: controller.selectedDate.value)
                      .snapshots() : FirebaseFirestore.instance
                      .collection("mytask/mytask/alltask")
                      .where("asignee", isEqualTo: FireBase.userInfo['name']).where("createDate", isEqualTo: controller.selectedDate.value)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData && snapshot.data != null) {
                        print(controller.selectedDate.value);
                        print("AllTaskController.selectedDate");
                        return Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> allTaskmap =
                                    snapshot.data!.docs[index].data()
                                        as Map<String, dynamic>;

                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ListTile(
                                    tileColor: Colors.white,
                                    title: Text(allTaskmap["title"]),
                                    subtitle: Text(allTaskmap["description"]),
                                    trailing: Icon(Icons.more_vert),
                                  ),
                                );
                              }),
                        );
                      } else {
                        return Text(
                          "No Data",
                          style: TextStyle(color: Colors.blue),
                        );
                      }
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
