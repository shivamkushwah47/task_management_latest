import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_management_app/core/firebase/firebase.dart';
import 'package:task_management_app/core/global/colors.dart';
import 'package:task_management_app/core/routes.dart';
import 'package:task_management_app/core/widget/scrollglowremover.dart';
import 'package:task_management_app/feature/admin_home/controller/home_page-controller.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loader.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
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
                        backgroundImage:
                            AssetImage('assets/Image/Profileimage.png'),
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
                iconTheme: IconThemeData(color: Colors.black),
                centerTitle: true,
                title: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
                      child: CircleAvatar(
                          radius: Get.width * 0.052,
                          backgroundImage:
                              AssetImage('assets/Image/Profileimage.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 20, 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(FireBase.userInfo['name'],
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.height * 0.028)),
                          Text(
                            FireBase.userInfo['role'],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: Get.height * 0.018),
                          )
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.indigo.shade400,
                      child: IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.Notification);
                          },
                          icon: Icon(
                            Icons.notifications,
                          )),
                    ),
                  ],
                ),
                elevation: 0.7,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[Colors.white, Colors.white])),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.005,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Project',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: Get.height * 0.03,
                                    fontWeight: FontWeight.w500)),
                            Obx(() => SizedBox(
                                  width: 140,
                                  height: 50,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      items: controller.projectList
                                          .map((String item) =>
                                              DropdownMenuItem<String>(
                                                  child: Text(item,
                                                      style: TextStyle(
                                                          color: Colors.grey)),
                                                  value: item))
                                          .toList(),
                                      onChanged: (newValue) {
                                        print(
                                            "previous ${controller.selected}");
                                        print("selected $newValue");
                                        controller.selected.value =
                                            newValue.toString();
                                      },
                                      value: controller.selected.toString(),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: Get.height * 0.25,
                          child: ScrollGlowRemover(
                            child: ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return controller.loader.value
                                    ? Shimmer.fromColors(
                                        baseColor: const Color(0xFFEBEBF4),
                                        highlightColor: const Color(0xFFF4F4F4),
                                        child: Container(
                                          height: 250,
                                          width: Get.width * 0.51,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 250,
                                        width: Get.width * 0.51,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Image/1onboarding.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              backgroundBlendMode:
                                                  BlendMode.darken,
                                              gradient: LinearGradient(colors: [
                                                GlobalColor.customMaterialColor
                                                    .withOpacity(0.5),
                                                Colors.blue.withOpacity(0.3)
                                              ])),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "project name",
                                                      style: TextStyle(
                                                          color:
                                                              GlobalColor.white,
                                                          height: 1.1,
                                                          fontSize:
                                                              Get.width * 0.06),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Get.height * 0.008,
                                                    ),
                                                    Text("your projects",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                            color: GlobalColor
                                                                .white,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                Get.width *
                                                                    0.035)),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child:
                                                          LinearProgressIndicator(
                                                        value: 0.5,
                                                        backgroundColor:
                                                            Colors.white70,
                                                        minHeight:
                                                            Get.height * 0.013,
                                                        color: Colors.indigo,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                              },
                            ),
                          )),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       padding: EdgeInsets.all(16),
                      //       width: Get.width * 0.46,
                      //       height: Get.height * 0.26,
                      //       child: Column(
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Text("Progress Task",
                      //                   style: TextStyle(
                      //                       fontSize: Get.height * 0.025,
                      //                       fontWeight: FontWeight.bold,
                      //                       color: Colors.white)),
                      //             ],
                      //           ),
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     0, 20, 0, 10),
                      //                 child: Text("UI Design",
                      //                     style: TextStyle(
                      //                         fontSize: Get.height * 0.025,
                      //                         fontWeight: FontWeight.bold,
                      //                         color: Colors.white)),
                      //               ),
                      //             ],
                      //           ),
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.end,
                      //             children: [
                      //               Text("08/01/2023",
                      //                   style: TextStyle(
                      //                       fontSize: Get.height * 0.015,
                      //                       fontWeight: FontWeight.bold,
                      //                       color: Colors.white)),
                      //             ],
                      //           ),
                      //           SizedBox(
                      //             height: Get.height * 0.05,
                      //           ),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 "Progress",
                      //                 style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: Get.height * 0.017,
                      //                 ),
                      //               ),
                      //               Text(
                      //                 "50%",
                      //                 style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: Get.height * 0.017,
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //           LinearProgressIndicator(
                      //             value: 0.5,
                      //             backgroundColor: Colors.white,
                      //             minHeight: Get.height * 0.01,
                      //             color: Colors.green,
                      //           ),
                      //         ],
                      //       ),
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(20.0),
                      //         gradient: LinearGradient(
                      //           colors: [
                      //             Colors.indigo,
                      //             Colors.blue,
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       padding: EdgeInsets.all(16),
                      //       width: Get.width * 0.46,
                      //       height: Get.height * 0.26,
                      //       child: Column(
                      //         // crossAxisAlignment: CrossAxisAlignment.start,
                      //
                      //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Text("Done Task",
                      //                   style: TextStyle(
                      //                       fontSize: Get.height * 0.025,
                      //                       fontWeight: FontWeight.bold,
                      //                       color: Colors.white)),
                      //             ],
                      //           ),
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     0, 20, 0, 10),
                      //                 child: Text("UI Design",
                      //                     style: TextStyle(
                      //                         fontSize: Get.height * 0.025,
                      //                         fontWeight: FontWeight.bold,
                      //                         color: Colors.white)),
                      //               ),
                      //             ],
                      //           ),
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.end,
                      //             children: [
                      //               Text("08/01/2023",
                      //                   style: TextStyle(
                      //                       fontSize: Get.height * 0.015,
                      //                       fontWeight: FontWeight.bold,
                      //                       color: Colors.white)),
                      //             ],
                      //           ),
                      //           SizedBox(
                      //             height: Get.height * 0.05,
                      //           ),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 "Progress",
                      //                 style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: Get.height * 0.017,
                      //                 ),
                      //               ),
                      //               Text(
                      //                 "65%",
                      //                 style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: Get.height * 0.017,
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //           LinearProgressIndicator(
                      //             value: 0.65,
                      //             backgroundColor: Colors.white,
                      //             minHeight: Get.height * 0.01,
                      //             color: Colors.green,
                      //           ),
                      //         ],
                      //       ),
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(20.0),
                      //         gradient: LinearGradient(
                      //             begin: Alignment.topLeft,
                      //             end: Alignment.topRight,
                      //             colors: <Color>[
                      //               Colors.purpleAccent,
                      //               Colors.purple,
                      //               Colors.indigo,
                      //             ]),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('All Task',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: Get.height * 0.03,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            // borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("UBI SALES TASK",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width * 0.95,
                              margin: EdgeInsets.only(top: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.TodoPage);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: Get.height * 0.09,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.bottomRight,
                                              colors: <Color>[
                                                Colors.purple,
                                                Colors.purpleAccent,
                                                Colors.blueAccent
                                              ]),
                                          // color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(children: [
                                          CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 25,
                                              child: const Icon(Icons.toc,
                                                  color: Colors.indigo)),
                                          SizedBox(
                                            width: Get.width * 0.06,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Todo',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: Get.height * 0.025,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "10 Task",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          Get.height * 0.015,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "-",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          Get.height * 0.015,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "1 Started",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          Get.height * 0.015,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: Get.width * 0.95,

                              //margin: EdgeInsets.fromLTRB(, , right, bottom),

                              margin: EdgeInsets.only(top: 10),

                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.InProgressPage);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: Get.height * 0.09,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: <Color>[
                                                Colors.indigo,
                                                Colors.blue
                                              ]),
                                          // color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        //
                                        // decoration: BoxDecoration(
                                        //   color: Colors.purpleAccent,
                                        //   borderRadius: BorderRadius.circular(10),
                                        // ),
                                        child: Row(children: [
                                          CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 25,
                                              child: const Icon(
                                                  Icons.cached_rounded,
                                                  color: Colors.indigo)),
                                          SizedBox(
                                            width: Get.width * 0.06,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'In Progress',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: Get.height * 0.025,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "10 Task",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          Get.height * 0.015,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "-",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          Get.height * 0.015,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "8 In Progress",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          Get.height * 0.015,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: Get.width * 0.95,

                              //margin: EdgeInsets.fromLTRB(, , right, bottom),

                              margin: EdgeInsets.only(top: 10),

                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.donePage);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: Get.height * 0.09,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: <Color>[
                                                Colors.orangeAccent,
                                                Colors.yellow
                                              ]),
                                          // color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(children: [
                                          CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 25,
                                              child: const Icon(Icons.done,
                                                  color: Colors.indigo)),
                                          SizedBox(
                                            width: Get.width * 0.06,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Done',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: Get.height * 0.025,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "10 Task",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          Get.height * 0.015,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "-",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          Get.height * 0.015,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "8 Done",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          Get.height * 0.015,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
