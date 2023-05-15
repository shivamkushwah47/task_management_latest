import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_app/core/components/custombutton.dart';
import 'package:task_management_app/core/components/custombuttonsecond.dart';
import 'package:task_management_app/core/firebase/firebase.dart';
import 'package:task_management_app/core/routes.dart';
import 'package:task_management_app/feature/admin_create_task/controller/create_task_controller.dart';

class CreateTaskView extends GetView<CreateTaskController> {
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
                      colors: <Color>[Colors.indigo.shade400, Colors.blue])),
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
              'Create New Task ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.height * 0.030,
                  fontWeight: FontWeight.w400),
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
            child: Form(
              key: controller.taskFormKey,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: Get.width,
                      height: Get.height * 0.3,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.indigo]),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: TextFormField(
                              // controller: _Titlecontroller,
                              cursorColor: Colors.white,
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                labelText: "Title",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                                labelStyle: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              validator: controller.requiredValidator,
                              controller: controller.titlecontroller,
                              onChanged: (value) {
                                controller.taskTitle = value;
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: TextFormField(
                              // controller: _Titlecontroller,
                              cursorColor: Colors.white,
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                labelText: "Description",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                                labelStyle: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              validator: controller.requiredValidator,
                              controller: controller.desccontroller,
                              onChanged: (value) {
                                controller.taskDesc = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.height * .24,
                    width: Get.width * 1,
                    height: Get.height * .6,
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.04),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: Get.width*0.35,
                                      height: Get.width*0.16,
                                      child: DropdownSearch<String>(
                                        popupProps: PopupProps.menu(
                                          showSelectedItems: true,
                                          disabledItemFn: (String s) =>
                                              s.startsWith('I'),
                                        ),
                                        items:
                                            FireBase.userInfo['role'] == "admin"
                                                ? controller.Alluser
                                                : controller.userlist,
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            labelText: "Asignee",
                                            hintText: "select name",
                                          ),
                                        ),
                                        onChanged: (value) {
                                          controller.selecteduser = value;
                                        },
                                      )),
                                  Obx(() =>SizedBox(
                                    width: Get.width*0.35,
                                    height: Get.width*0.16,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      items: controller.priorityItems
                                          .map((String item) =>
                                          DropdownMenuItem<String>(child: Text(item,style: TextStyle(color: Colors.grey)), value: item.toString()))
                                          .toList(),
                                      onChanged: (newValue) {
                                        print("previous ${controller.selectedPriority}");
                                        print("selected $newValue");
                                        controller.selectedPriority.value = newValue.toString();
                                      },
                                      value:  controller.selectedPriority.toString(),
                                    ),
                                  )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Get.width*.35,
                                    height: Get.width*.16,
                                    child: TextFormField(
                                      //  controller: _Datecontroller,
                                      cursorColor: Colors.white,
                                      style: GoogleFonts.montserrat(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: " Start Date",
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            controller.chooseDate();
                                            // _selectDate(context);
                                          },
                                          child: Icon(
                                            Icons.calendar_month_outlined,
                                            color: Colors.black,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        fillColor: Colors.black,
                                        labelStyle: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                      ),
                                      initialValue:
                                          controller.selectedDate.toString(),
                                    ),
                                  ),
                                  Container(
                                    width: Get.width*.35,
                                    height: Get.width*.16,
                                    child: TextFormField(
                                      onTap: () {},
                                      //  controller: _Datecontroller,
                                      cursorColor: Colors.white,
                                      style: GoogleFonts.montserrat(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: " End Date",
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            controller.chooseDate();
                                          },
                                          child: Icon(
                                            Icons.calendar_month_outlined,
                                            color: Colors.black,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        fillColor: Colors.black,
                                        labelStyle: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 8),
                                child: TextFormField(
                                  // controller: _Titlecontroller,
                                  cursorColor: Colors.black,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Summary",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    fillColor: Colors.black,
                                    labelStyle: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  validator: controller.requiredValidator,
                                  controller: controller.summarycontroller,
                                  onChanged: (value) {
                                    controller.tasksummary = value;
                                  },
                                ),
                              ),
                              Obx(() =>
                                  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Colors.blueGrey[200],
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          )),
                                      onPressed: () {
                                        controller.AttachFile().then((value) => controller.fileAttached.value = true);
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.attachment_outlined),
                                          SizedBox(width: Get.width * 0.02),
                                          Text("Attach the file"),
                                        ],
                                      )),
                                  SizedBox(width: 10,),
                                  controller.fileAttached.value ?
                                  Icon(Icons.done_outline_rounded,
                                    color: Colors.green,
                                    shadows: [Shadow(color: Colors.green,blurRadius: 1.5)],):Text("")
                                ],
                              )),
                              Container(
                                child: Column(children: [
                                  Obx(() => CheckboxListTile(
                                        title: const Text(
                                          "Are you ready to create a task",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        checkColor: Colors.white,
                                        activeColor: Colors.blueGrey,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        checkboxShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        value: controller.checkedValue.value == 1,
                                        onChanged: (val) {
                                          val ?? true
                                              ? controller.checkedValue.value = 1
                                              : controller.checkedValue.value = null;
                                        },
                                      )),
                                ]),
                              ),
                              SizedBox(height: Get.height * 0.005),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.4,
                                    child: CustomButtonCancel(
                                      title: "CANCEL",
                                      onPress: () {
                                        controller.titlecontroller.clear();
                                        controller.desccontroller.clear();
                                        controller.summarycontroller.clear();
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.4,
                                    child: CustomButton(
                                      title: "CREATE",
                                      onPress: () {
                                        if (controller.pickedFile == null) {
                                          controller.gotoCreateTask(context);
                                        } else {
                                          controller.uploadFile().then((url) {
                                            controller.gotoCreateTask(
                                                context, url);
                                            controller.pickedFile = null;
                                            controller.fileAttached.value = false;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
