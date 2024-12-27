import 'package:agecalculator/models/Birthday.dart';
import 'package:agecalculator/singleton/singleTond.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../singleton/databasehelper.dart';
class Ageformcontroller extends GetxController {
  late TextEditingController namecontroller;
  Rx<DateTime> currentDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime?> dateofbirth = Rx<DateTime?>(null);
  Rx<DateTime?> upcomingbirthday = Rx<DateTime?>(null);
  RxString Gender = RxString("Male");
  RxString usrName = "".obs;
  RxInt yearsold = 0.obs;
  RxString Event = RxString("BirthDay");
  RxBool isMale = false.obs;
  RxBool isfemale = false.obs;
  RxBool isBirthdaySelected = false.obs;
  RxBool isAnniversarySelected = false.obs;
  RxBool isOthersSelected = false.obs;
  late Databasehelper dbHelper;
  RxList<User> user = <User>[].obs;
  RxBool isGenderSelected = false.obs;
  RxBool isEventSelected = false.obs;
  late SingleTon r = SingleTon();
  @override
  void onInit() {
    super.onInit();
    namecontroller = TextEditingController();
    currentDate.value = DateTime.now();
    dbHelper = Databasehelper();
      dbHelper.initializeDataBase().then((value) {
      fetchUsers();
    });
    SetItems();
  }
  void fetchUsers() async {
    try {
      var fetchedUsers = await dbHelper.retreiveUsers();
      if (fetchedUsers.isEmpty) {
        print("No users found");
      } else {
        user.assignAll(fetchedUsers);
        print("Users fetched: ${user.length}");
      }
    } catch (e) {
      print("Error fetching users: $e");
    }
  }
  Future<int> addUser(User user) async {
    int result = await dbHelper.insertUser(user);
    fetchUsers();
    return result;
  }
  Future<int> updateUser(User user) async {
    int result = await dbHelper.updateUser(user);
    fetchUsers();
    return result;
  }
  Future<void> Update() async {
    User user = User(
      id: r.userId,
      userName: namecontroller.text,
      dateOfBirth: dateofbirth.value!,
      upcomingDateOfBirth: upcomingbirthday.value!,
      yearsOld: yearsold.value,
      gender: Gender.value,
      event: Event.value,
      createdDate:r.creationDate!,
    );
    await updateUser(user);
    namecontroller.clear();
    Get.snackbar(
      "Success",
      "Data is Updated Successfully",
      backgroundColor: Color(0xffC07FFA),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 1),
    );
  }
  Future<void> Save() async {
    final userName = namecontroller.text;
    if (userName.isEmpty || dateofbirth.value == null || upcomingbirthday.value == null || currentDate.value==null) {
      Get.snackbar(
        "Error",
        "Please fill in all fields",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 1),
      );
      return;
    }

    User user = User(
      userName: userName,
      dateOfBirth: dateofbirth.value!,
      upcomingDateOfBirth: upcomingbirthday.value!,
      yearsOld: yearsold.value,
      gender: Gender.value,
      event: Event.value,
      createdDate: currentDate.value,
    );

    int result = await addUser(user);
    if (result > 0) {
      namecontroller.clear();
      Get.snackbar(
        "Success",
        "Data has been saved successfully",
        backgroundColor: Color(0xffC07FFA),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP
      );
      fetchUsers();
    } else {
      Get.snackbar(
        "Error",
        "Failed to save data",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP
      );
    }
  }

  Future<void> deleteUser(int id) async {
    await dbHelper.deleteUser(id);
   }
  Future<void> Delete() async {
    await deleteUser(r.userId!);
    Get.snackbar(
      "Success",
      "Data is Deleted Successfully",
      backgroundColor: Color(0xffC07FFA),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP
    );
  }
  void SetItems() {
    if (r.isFromResultSave == false) {
      namecontroller.text = r.userName ?? '';
      if (r.userGender == "Male") {
        isMale.value = true;
        isfemale.value = false;
        isGenderSelected.value = true;
      } else if (r.userGender == "Female") {
        isfemale.value = true;
        isMale.value = false;
        isGenderSelected.value = true;
      } else {
        isfemale.value = false;
        isMale.value = false;
      }

      if (r.eventSelection == "BirthDay") {
        isBirthdaySelected.value = true;
        isAnniversarySelected.value = false;
        isOthersSelected.value = false;
        isEventSelected.value = true;
      } else if (r.eventSelection == "Anniversary") {
        isAnniversarySelected.value = true;
        isEventSelected.value = true;
        isBirthdaySelected.value = false;
        isOthersSelected.value = false;
      } else if (r.eventSelection == "Others") {
        isOthersSelected.value = true;
        isEventSelected.value = true;
        isBirthdaySelected.value = false;
        isAnniversarySelected.value = false;
      } else {
        isBirthdaySelected.value = false;
        isAnniversarySelected.value = false;
        isOthersSelected.value = false;
      }
    } else {
      // return;
    }
  }

}
