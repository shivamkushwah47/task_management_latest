import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:task_management_app/core/components/loader.dart';
import 'package:task_management_app/core/firebase/firebase.dart';
import 'package:task_management_app/core/routes.dart';
import 'package:task_management_app/feature/admin_team_member/controller/team_page_controller.dart';

class TeamView extends GetView<TeamController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: <Color>[Colors.indigo, Colors.blue])),
              accountName: Text(FireBase.userInfo['name']),
              accountEmail: Text(FireBase.userInfo['email']),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/Image/Profileimage.png'),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(Routes.Notification);
              },
              leading: Icon(Icons.notifications),
              title: Text("Notification"),
            ),
            ListTile(
              onTap: () {
                controller.deleteUser(FireBase.userInfo['id'], context);
              },
              leading: Icon(Icons.lock),
              title: Text("Delete Account"),
            ),
            ListTile(
              onTap: () {
                controller.Logout();
              },
              leading: Icon(Icons.logout),
              title: Text("Log out"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TEAM MEMBER ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.height * 0.030,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.blue, Colors.indigo])),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Container(
          child: SizedBox(
            height: Get.height,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: Get.width,
                    height: Get.height * 0.4,
                    decoration: const BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.indigo]),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.06,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [],
                          ),
                        ),
                        Image.asset(
                          'assets/Image/Teammenber.png',
                          height: Get.height * 0.115,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  // top: Get.height * .28,
                  width: Get.width * 1,
                  height: Get.height * .56,
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(onTap: () {
                                  Get.toNamed(Routes.AddTeamMember);
                                },
                                  child: Text('Add New Member',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("mytask/mytask/users")
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text('Something went wrong');
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.active) {
                                  if (snapshot.hasData &&
                                      snapshot.data != null) {
                                    return Expanded(
                                      child: ListView.builder(
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (context, index) {
                                            Map<String, dynamic> usersmap =
                                                snapshot.data!.docs[index]
                                                        .data()
                                                    as Map<String, dynamic>;

                                            return ListTile(
                                              isThreeLine: true,
                                              leading: CircleAvatar(
                                                backgroundColor: Colors.blue,
                                                child: Text(
                                                    (index + 1).toString()),
                                              ),
                                              tileColor: Colors.grey,
                                              onTap: () {},
                                              title: Text(usersmap["name"]),
                                              subtitle: Text(usersmap["email"]),
                                              trailing: IconButton(
                                                icon: Icon(Icons.more_vert),
                                                onPressed: () {
                                                  Get.defaultDialog(
                                                    onConfirm: () async {
                                                      Loader.showLoader(
                                                          context);
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                              "mytask/mytask/users")
                                                          .doc(usersmap["id"])
                                                          .delete()
                                                          .then((value) {
                                                        Get.back();
                                                        Get.back();
                                                      });
                                                    },
                                                    title: "Delete User ?",
                                                    middleText:
                                                        "Are you sure want to delete this user",
                                                    backgroundColor:
                                                        Colors.blueGrey,
                                                    titleStyle: TextStyle(
                                                        color: Colors.white),
                                                    middleTextStyle: TextStyle(
                                                        color: Colors.white),
                                                    radius: 30,
                                                    textConfirm: "Confirm",
                                                    textCancel: "Cancel",
                                                    cancelTextColor:
                                                        Colors.white,
                                                    confirmTextColor:
                                                        Colors.white,
                                                    buttonColor: Colors.red,
                                                    //confirm: controller.Logout()
                                                  );
                                                },
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
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
