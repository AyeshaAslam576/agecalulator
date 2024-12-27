import 'package:agecalculator/controllers/resultcontroller.dart';
import 'package:agecalculator/routes/route.dart';
import 'package:agecalculator/singleton/singleTond.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class Results extends StatelessWidget {
   final Resultcontroller resultController = Get.put(Resultcontroller());
   Results({super.key});
  SingleTon s = SingleTon();
  Widget build(BuildContext context) {
    resultController.CalculateAGeStat(s.DateOfBirthToCalculate!);
      return Scaffold(
  backgroundColor: Colors.white,
  appBar: AppBar(
    leading: IconButton(onPressed: () {
      if(s.userPath == 'calculator') {
        s.userPath = '';
        Get.offNamed(ScreenRouts.calculator);
      }
      else {
        Get.offNamed(ScreenRouts.favorite);
      }
    }, icon: Icon(Icons.arrow_back_ios_new)),
    title: Text("Results", style: GoogleFonts.lexend(
        fontWeight: FontWeight.w300, fontSize: 20),),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
  ),
  body: SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Expanded(
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff7473E2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      Positioned(
                        top: 10,
                        child: Obx(() {
                          return Text(
                            resultController.YearsOld.value != null
                                ? "${resultController.YearsOld.value.toString().padLeft(2, '0')}"
                                : "20",
                            style: GoogleFonts.lexend(textStyle: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 64,),));
                        }),
                      ),
                      Positioned(
                          bottom: 0.5,
                          left: 0,
                          right: 0,
                          child: Container(
                              width: double.infinity,

                              decoration: BoxDecoration(
                                color: Color(0xffC07FFA),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Years",
                                  style: GoogleFonts.lexend(textStyle: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      backgroundColor: Color(0xffC07FFA)),)),
                              )))
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff7473E2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Obx(() {
                            return Text(
                              resultController.MonthsOld.value != null
                                  ? "${resultController.MonthsOld
                                  .value.toString().padLeft(2, '0')}"
                                  : "00", textAlign: TextAlign.center,
                              style: GoogleFonts.lexend(textStyle: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 64,
                              ),));
                          }),),
                      Positioned(
                          bottom: 0.5,
                          left: 0,
                          right: 0,
                          child: Container(
                              width: double.infinity,

                              decoration: BoxDecoration(
                                color: Color(0xffC07FFA),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),

                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child:  Text(
                                    "Months", textAlign: TextAlign.center,
                                    style: GoogleFonts.lexend(textStyle: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        backgroundColor: Color(
                                            0xffC07FFA)),)),
                              )))
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff7473E2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Obx(() {
                            return Text(
                              resultController.DaysOld.value != null
                                  ? "${resultController.DaysOld.value.toString().padLeft(2, '0')}"
                                  : "00",
                              style: GoogleFonts.lexend(textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 64),));
                          })),
                      Positioned(
                          bottom: 0.5,
                          left: 0,
                          right: 0,
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffC07FFA),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),

                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Days",
                                  style: GoogleFonts.lexend(textStyle: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      backgroundColor: Color(0xffC07FFA)),)),
                              )))
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
padding: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffAF6C46).withOpacity(0.2)
              ,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Age Stats", style: GoogleFonts.lexend(textStyle: TextStyle(
                          color: Color(0xffAF6C46),
                          fontSize: 22,
                          fontWeight: FontWeight.w600),)),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Years",style: GoogleFonts.inter(textStyle: TextStyle(
                          color: Color(0xffAF6C46),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),),),
                      Spacer(),
                      Obx(() {
                        return Text(resultController.YearsOld.value != null
                            ? "${resultController.YearsOld.value}"
                            : "00",style: GoogleFonts.inter(textStyle: TextStyle(
                            color: Color(0xffAF6C46),
                        fontSize: 22,
                        fontWeight: FontWeight.w600),),);
                      }),
                    ],
                  ),
                  Divider(
                    color: Color(0xffAF6C46),
                  ),
                  Row(
                    children: [
                      Text("Month",style: GoogleFonts.inter(textStyle: TextStyle(
                          color: Color(0xffAF6C46),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),),),
                      Spacer(),
                      Obx(() {
                        return Text(resultController.MonthStat.value != null
                            ? "${resultController.MonthStat.value}"
                            : "00",style: GoogleFonts.inter(textStyle: TextStyle(
                            color: Color(0xffAF6C46),
                        fontSize: 22,
                        fontWeight: FontWeight.w600),),);
                      }),
                    ],
                  ),
                  Divider(
                    color: Color(0xffAF6C46),
                  ),
                  Row(
                    children: [
                      Text("Weeks",style: GoogleFonts.inter(textStyle: TextStyle(
                          color: Color(0xffAF6C46),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),),),
                      Spacer(),
                      Obx(() {
                        return Text(resultController.WeekStat.value != null
                            ? "${resultController.WeekStat.value}"
                            : "00",style: GoogleFonts.inter(textStyle: TextStyle(
                            color: Color(0xffAF6C46),
                            fontSize: 22,
                            fontWeight: FontWeight.w600),),);
                      }),
                    ],
                  ),
                  Divider(
                    color: Color(0xffAF6C46),
                  ),
                  Row(
                    children: [
                      Text("Days",style: GoogleFonts.inter(textStyle: TextStyle(
                          color: Color(0xffAF6C46),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),),),
                      Spacer(),
                      Obx(() {
                        return Text(resultController.DayStat.value != null
                            ? "${resultController.DayStat.value}"
                            : "00",style: GoogleFonts.inter(textStyle: TextStyle(
                            color: Color(0xffAF6C46),
                            fontSize: 22,
                            fontWeight: FontWeight.w600),),);
                      }),
                    ],
                  ),
                  Divider(
                    color: Color(0xffAF6C46),
                  ),
                  Row(
                    children: [
                      Text("Hours",style: GoogleFonts.inter(textStyle: TextStyle(
                          color: Color(0xffAF6C46),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),),),
                      Spacer(),
                      Obx(() {
                        return Text(resultController.HourStat.value != null
                            ? "${resultController.HourStat.value}"
                            : "00",style: GoogleFonts.inter(textStyle: TextStyle(
                            color: Color(0xffAF6C46),
                            fontSize: 22,
                            fontWeight: FontWeight.w600),),);
                      }),
                    ],
                  ),
                  Divider(
                    color: Color(0xffAF6C46),
                  ),
                  Row(
                    children: [
                      Text("Minutes",style: GoogleFonts.inter(textStyle: TextStyle(
                          color: Color(0xffAF6C46),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),),),
                      Spacer(),
                      Obx(() {
                        return Text(
                            resultController.MinuteStat.value != null
                                ? "${resultController.MinuteStat.value}"
                                : "00",style: GoogleFonts.inter(textStyle: TextStyle(
                            color: Color(0xffAF6C46),
                            fontSize: 22,
                            fontWeight: FontWeight.w600),),);
                      }),
                    ],
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xff4C8691).withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Upcoming Birthday", style: GoogleFonts.inter(textStyle: TextStyle(
                          color: Color(0xff4C8691),
                          fontWeight: FontWeight.w600,
                          fontSize: 22),)),

                      Obx(() {
                        return Text("${resultController.reminMonth.value ??
                            0} Months ${resultController.remindays.value ??
                            0} Days", style:GoogleFonts.inter(textStyle:  TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),));
                      }),
                      Obx(() {
                        return Text(
                          "${resultController.birthDay.value ?? "..."}",
                          style: GoogleFonts.inter(textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),));
                      }),
                    ],
                  ),
                  Spacer(),
                  Image.asset("assets/2872396 1.png")

                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xffCD616F).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CountdownTimer(
                endTime: resultController.upcomingBirthday.value
                    ?.millisecondsSinceEpoch ?? DateTime
                    .now()
                    .millisecondsSinceEpoch + 1000 * 60 * 60 * 24,

                widgetBuilder: (_, remainingtime) {
                  if (remainingtime == null) {
                    resultController.DispalyBirthdayDialogue();
                    return Text(
                      "Happy Birthday!",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Birthday Countdown", style: GoogleFonts.inter(textStyle: TextStyle(
                          color: Color(0xffCD616F),
                          fontWeight: FontWeight.w600,
                          fontSize: 22),)),

                      Text(
                        "${remainingtime.days ?? 0} Days ${remainingtime.hours ??
                            0} Hours ${remainingtime.min  ??
                            0} Minutes ${remainingtime.sec ?? 0} Seconds ",
                          style: GoogleFonts.inter(textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18),)
                      ),
                    ],
                  );
                },
              )

          ),
          SizedBox(height: 15,),
        ],
      ),
    ),
  ),
  bottomNavigationBar: BottomAppBar(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Visibility(
          visible: s.isFromAgeCalculator ?? false,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff7473E2),
                  ),
                  child: ElevatedButton(onPressed: () {
                    Get.offNamed(ScreenRouts.calculator);
                  }, child:
                  Text("Back", style: GoogleFonts.lexend(textStyle: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w400),)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff7473E2),
                        elevation: 0,
                        side: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffC07FFA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(onPressed: () {
                    s.isFromResultSave = true;
                    final upcomingbirthdate=resultController.upcomingBirthday.value;
                    final totalYearsOld=resultController.YearsOld.value;
                    s.upcomingBirthday=upcomingbirthdate;
                    s.yearsOld=totalYearsOld;
                    s.DateOfBirthToCalculate=resultController.dateOfBirth.value;
                    Get.offNamed(ScreenRouts.ageform);
                  }, child:
                  Text("Save",
                    style: GoogleFonts.lexend(textStyle: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w400),)
                  ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffC07FFA),
                        elevation: 0,
                        side: BorderSide.none),
                  ),
                ),
              ),
            ],
          ),
          replacement:
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff7473E2),
                  ),
                  child: ElevatedButton(onPressed: () {
                    resultController.Delete();
                  if( s.userPath=="calculator"){
                    s.userPath="";
                    Get.offNamed(ScreenRouts.calculator);
                  }
                  else{
                    Get.offNamed(ScreenRouts.favorite);
                  }
                    Get.back();
                  }, child:
                  Text("Delete", style: GoogleFonts.lexend(textStyle: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w400),)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff7473E2),
                        elevation: 0,
                        side: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffC07FFA),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                    s.isFromResultSave = false;
                    final birthdate=resultController.dateOfBirth.value;
                    final upcomingbirthdate=resultController.upcomingBirthday.value;
                    final totalYearsOld=resultController.YearsOld.value;
                    s.upcomingBirthday=upcomingbirthdate;
                    s.yearsOld=totalYearsOld;
                    s.DateOfBirthToCalculate=birthdate;
                    Get.toNamed(ScreenRouts.ageform);
                  }, child:
                  Text("Edit", style: GoogleFonts.lexend(textStyle: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w400),)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffC07FFA),
                        elevation: 0,
                        side: BorderSide.none),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
  ),
);

  }
}
