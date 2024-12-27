import 'package:agecalculator/models/Birthday.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../singleton/databasehelper.dart';
class Favouritecontroller extends GetxController{
  RxList<User> user=<User>[].obs;
  RxInt Lenght=0.obs;
  late Databasehelper dbhelper;
@override
@override
void onInit() {
  super.onInit();
  dbhelper = Databasehelper();
  dbhelper.initializeDataBase().then((value) {
    print("Database initialized");
    fetchUsers();
    Get.forceAppUpdate();
  }).catchError((e){
    print("The error occured  ${e}");
  });
}

  void fetchUsers() async {
    try {
      var fetchedUsers = await dbhelper.retreiveUsers();
      if (fetchedUsers.isEmpty) {
        print("No users found");
      } else {
        user.assignAll(fetchedUsers);
Lenght.value=user.length;
        print("Users fetched: ${user.length}");
      }
    } catch (e) {
      print("Error fetching users: $e");
    }
  }
}