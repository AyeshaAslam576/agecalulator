import 'package:agecalculator/models/Birthday.dart';
import 'package:agecalculator/singleton/databasehelper.dart';
import 'package:agecalculator/singleton/singleTond.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Resultcontroller extends GetxController {
  RxInt YearsOld = 0.obs;
  RxInt MonthsOld = 0.obs;
  RxInt DaysOld = 0.obs;
  RxInt MonthStat = 0.obs;
  RxInt WeekStat = 0.obs;
  RxInt DayStat = 0.obs;
  RxInt HourStat = 0.obs;
  RxInt MinuteStat = 0.obs;
  RxInt reminMonth = 0.obs;
  RxInt remindays = 0.obs;
  RxString birthDay = ''.obs;
  Rx<DateTime?> dateOfBirth = Rx<DateTime?>(null);
  Rx<DateTime?> upcomingBirthday = Rx<DateTime?>(null);
  Rx<DateTime> currentDate = Rx<DateTime>(DateTime.now());
  Rx<Duration> countdown = Duration().obs;
  RxList<User> user = <User>[].obs;
  late Databasehelper dbhelper;
  late SingleTon r = SingleTon();
  @override
  void onInit() {
    super.onInit();
    currentDate.value = DateTime.now();
    dbhelper = Databasehelper();
    dbhelper.initializeDataBase().then((value) {
      fetchUsers();
    });
  }

  void CalculateUpcomingBirthday() {
    DateTime currentDate = DateTime.now();
    DateTime BirthdayCheck = DateTime(currentDate.year, dateOfBirth.value!.month, dateOfBirth.value!.day);
    if (BirthdayCheck.isBefore(currentDate)) {
      BirthdayCheck = DateTime(currentDate.year + 1, dateOfBirth.value!.month, dateOfBirth.value!.day);
    }
    upcomingBirthday.value = BirthdayCheck;
    Duration UpcomingBirthDays = BirthdayCheck.difference(currentDate);
    reminMonth.value = (UpcomingBirthDays.inDays / 30).floor();
    remindays.value = UpcomingBirthDays.inDays % 30;
    birthDay.value = DateFormat('EEEE').format(BirthdayCheck);
  }

  void CalculateAGeStat(DateTime doBirth) {
    dateOfBirth.value = doBirth;
    int YearDiff = currentDate.value.year - doBirth.year;
    int MonthDiff = currentDate.value.month - doBirth.month;
    int dayDiff = currentDate.value.day - doBirth.day;
    if (dayDiff < 0) {
      MonthDiff = MonthDiff - 1;
      dayDiff = dayDiff + DateTime(currentDate.value.year, currentDate.value.month, 0).day;
    }
    if (MonthDiff < 0) {
      MonthDiff = MonthDiff + 12;
      YearDiff = YearDiff - 1;
    }
    YearsOld.value = YearDiff;
    MonthsOld.value = MonthDiff;
    DaysOld.value = dayDiff;
    MonthStat.value = YearsOld.value * 12 + MonthsOld.value;
    WeekStat.value = (MonthStat.value * 4.345).floor();
    DayStat.value = YearsOld.value * 365 + MonthsOld.value * 30 + DaysOld.value;
    HourStat.value = DayStat.value * 24;
    MinuteStat.value = HourStat.value * 60;
    CalculateUpcomingBirthday();
  }

  void DispalyBirthdayDialogue() {
    Get.defaultDialog(
      title: "Time's up 🎉",
      titleStyle: TextStyle(color: Colors.purple, fontSize: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Happy Birthday To you Dear ✨🎂🎂🎂🎂🍰🍥🍥🍥", style: TextStyle(color: Colors.green, fontSize: 20)),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Okay",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
          ),
        ],
      ),
    );
  }

  Future<void> deleteUser(int id) async {
    await dbhelper.deleteUser(id);
    // fetchUsers();
  }

  void fetchUsers() async {
    try {
      var fetchedUsers = await dbhelper.retreiveUsers();
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

  Future<void> Delete() async {
    await deleteUser(r.userId!);
    Get.snackbar(
      "Success",
      "Data is Deleted Successfully",
      backgroundColor: Color(0xffC07FFA),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 1),
    );
  }
}
