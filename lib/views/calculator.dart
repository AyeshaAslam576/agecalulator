import 'package:agecalculator/controllers/calculatorcontroller.dart';
import 'package:agecalculator/routes/route.dart';
import 'package:agecalculator/singleton/singleTond.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class Calculator extends StatelessWidget {
  Calculator({super.key});
  final CalculatorController calculatorController = Get.put(CalculatorController());
  SingleTon s = SingleTon();
  @override
  Widget build(BuildContext context) {
    calculatorController.fetchUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Age Calculator",
          style: GoogleFonts.lexend(fontWeight: FontWeight.w300, fontSize: 20),
        ),
        leading: SizedBox(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff5974D8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current Date",
                        style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),)
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: calculatorController.pickCurrentDate,
                        child: Container(
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(() {
                            final currentDate = calculatorController.currentDate.value;
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    currentDate != null ? DateFormat('dd-MM-yyyy').format(currentDate) : "DD-MM-YYYY",
                                    style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 20),),
                                  ),
                                  Spacer(),
                                  Icon(Icons.calendar_month_outlined, color: Colors.black),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Date of Birth",
                        style:GoogleFonts.lexend(textStyle:  TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),)
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: calculatorController.pickDateOfBirth,
                        child: Container(
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(() {
                            final dateOfBirth = calculatorController.dateOfBirth.value;
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    dateOfBirth != null ? DateFormat('dd-MM-yyyy').format(dateOfBirth) : "DD-MM-YYYY",
                                    style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 20, color: Colors.grey),),
                                  ),
                                  Spacer(),
                                  Icon(Icons.calendar_month_outlined, color: Colors.black),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffC07FFA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Obx(() {
                          final dateOfBirth = calculatorController.dateOfBirth.value;
                          return ElevatedButton(
                            onPressed: () {
                              if (dateOfBirth == null) {
                                Get.snackbar(
                                    "Success", "Please Enter the Date of birth to calculate the age",
                                    backgroundColor:Color(0xffC07FFA),
                                    colorText: Colors.white,
                                    snackPosition: SnackPosition.TOP,
                                    duration: Duration(seconds: 1));
                                 } else {
                                s.isFromAgeCalculator = true;
                                s.DateOfBirthToCalculate=calculatorController.dateOfBirth.value;
                                print('Navigating with dateOfBirth: $dateOfBirth');
                                s.userPath = "calculator";
                                Get.offNamed(ScreenRouts.results);
                              }
                            },
                            child: Text(
                              "Calculate Age",
                              style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),)
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffC07FFA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My Favorite", style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w300))),
                    InkWell(
                      onTap: () {
                        Get.offNamed(ScreenRouts.favorite);
                      },
                      child: Row(
                        children: [
                          Text("See All ", style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w300))),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                return Visibility(
                  visible: calculatorController.Length.value > 0,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: calculatorController.Length.value,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final user = calculatorController.user[index];
                      final upcoming = DateFormat("dd-MM-yyyy").format(user.upcomingDateOfBirth);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: ListTile(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                              user.gender == "Male" ? "assets/boy-01 1.png" : "assets/girl-01 2.png",
                            ),
                            backgroundColor: Colors.white,
                          ),
                          onTap:  () {
                            s.userId=user.id;
                            s.isFromFav = true;
                            s.isFromAgeCalculator = false;
                            s.userName=user.userName;
                            s.eventSelection=user.event;
                            s.userGender=user.gender;
                            s.DateOfBirthToCalculate=user.dateOfBirth;
                            s.creationDate=user.createdDate;
                            s.eventSelection=user.event;
                            s.userPath = 'calculator';

                            Get.offNamed(ScreenRouts.results);
                          },
                          title: Text(
                            user.userName,
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
                          ),
                          tileColor: user.gender == "Male" ? Color(0xff7473E2).withOpacity(0.2) : Color(0xffC07FFA).withOpacity(0.2),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${user.yearsOld} ",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " Years Old",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Upcoming:",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " $upcoming",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      );
                    },
                  ),
                  replacement: Container(
                    child:Align(
                      alignment: Alignment.center,
                      child: Text("No Record Found",),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
