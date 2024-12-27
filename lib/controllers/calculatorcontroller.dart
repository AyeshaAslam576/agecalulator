import 'package:agecalculator/models/Birthday.dart';
import 'package:agecalculator/routes/route.dart';
import 'package:agecalculator/singleton/databasehelper.dart';
import 'package:agecalculator/singleton/singleTond.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sqflite/sqflite.dart';
class CalculatorController extends GetxController {
  SingleTon s=SingleTon();
  Rx<DateTime> currentDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime?> dateOfBirth = Rx<DateTime?>(null);
  Rx<Duration?> totalAge = Rx<Duration?>(null);
  Rx<bool> isMaleSelected = Rx<bool>(true);
  Rx<String> userName = Rx<String>("Ayesha");
  Rx<DateTime?> upComingBirthday = Rx<DateTime?>(null);
  Rx<DateTime?> YearsOld = Rx<DateTime?>(null);
  RxList<User> user=<User>[].obs;
  RxInt Length=0.obs;

  late Databasehelper  dbhelper;
  @override
  void onInit() {
    super.onInit();
    currentDate.value = DateTime.now();
    dbhelper = Databasehelper();
    dbhelper.initializeDataBase().then((value) {
      print("Database initialized");
      fetchUsers();
    }).catchError((e){
      print("The error is ${e}");
    });
  }

  @override
  void onReady() {
    print("onReady called");
    super.onReady();
  }

  void pickCurrentDate() async {
    DateTime? date = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      initialDate: currentDate.value ?? DateTime.now(),
    );
    if (date != null) {
      currentDate.value = date;
    }
  }

  void pickDateOfBirth() async {
    DateTime? date = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      initialDate: dateOfBirth.value ?? DateTime.now(),
    );
    if (date != null) {
      dateOfBirth.value = date;
    }
  }

  void fetchUsers() async {
    print("Fetch User Called");
    try {
      var fetchedUsers = await dbhelper.retreiveUsers();
      if (fetchedUsers.isEmpty) {
        print("No users found");
      } else {
        user.assignAll(fetchedUsers);
        Length.value=user.length;
        SetLength();
        print("Users fetched: ${user.length}");
      }
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  void SetLength(){
    if(Length.value==0){
      return ;
    }
    else if(Length.value>=2){
      Length.value=2;
    }
    if(Length.value==1){
      Length.value=1;
    }
  }
}
