import 'package:agecalculator/controllers/ageformcontroller.dart';
import 'package:agecalculator/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../singleton/singleTond.dart';
class Ageform extends StatelessWidget {
  Ageform({super.key});
  final Ageformcontroller ageformcontroller = Get.put(Ageformcontroller());
  final SingleTon r = SingleTon();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Age Form",
          style: GoogleFonts.lexend(fontWeight: FontWeight.w300, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),)
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: ageformcontroller.namecontroller,
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    } else if (value.length > 30) {
                      return 'Name cannot be more than 30 characters';
                    }
                    return null;
                  },
                autofillHints: [AutofillHints.name],
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF4F4F4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF4F4F4)),
                  ),
                  fillColor: Color(0xffF4F4F4),
                  filled: true,
                  hintText: "Enter Your Name",
                  hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 16,color: Color(0xff858585)),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Date of Birth",
                    style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                    )),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height:42 ,
                decoration: BoxDecoration(
                  color: Color(0xffF4F4F4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Text(
                        DateFormat('dd-MM-yyyy').format(r.DateOfBirthToCalculate!),
                        style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20, color: Colors.black),)
                      ),
                      Spacer(),
                      Icon(Icons.calendar_month_outlined, color: Colors.black),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Gender",style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),),)
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Obx(() {
                      return InkWell(
                        onTap: () {
                          ageformcontroller.Gender.value = "Male";
                          r.userGender="Male";
                          ageformcontroller.isMale.value = true;
                          ageformcontroller.isfemale.value = false;
                          ageformcontroller.isGenderSelected.value=true;
                        },
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: Color(0xffE3E3F9),
                            border: Border.all(color: ageformcontroller.isMale
                                .value ? Color(0xff7473E2) : Colors
                                .transparent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                    "assets/boy-01 1.png"),
                              ),
                              Text("Male/Boy",style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),)),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Obx(() {
                      return InkWell(
                        onTap: () {
                          ageformcontroller.Gender.value = "Female";
                          r.userGender="Female";
                          ageformcontroller.isMale.value = false;
                          ageformcontroller.isfemale.value = true;
                          ageformcontroller.isGenderSelected.value=true;
                        },
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: Color(0xffC07FFA).withOpacity(0.2),
                            border: Border.all(color: ageformcontroller.isfemale
                                .value ? Color(0xff7473E2) : Colors
                                .transparent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                    "assets/girl-01 2.png"),
                              ),
                              Text("Female/Girl",style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.w400,
                                  color: Colors.black),)),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Event",style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),),)
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Obx(() {
                      return InkWell(
                        onTap: () {
                          ageformcontroller.Event.value = "BirthDay";
                          r.eventSelection="BirthDay";
                          ageformcontroller.isBirthdaySelected.value = true;
                          ageformcontroller.isAnniversarySelected.value = false;
                          ageformcontroller.isOthersSelected.value = false;
                          ageformcontroller.isEventSelected.value=true;
                        },
                        child: Container(
                          height: 120,
                          decoration:BoxDecoration(
                            color: ageformcontroller.isBirthdaySelected
                                .value ? Color(0xffEFE2DA):Color(0xffF4F4F4),
                            border: Border.all(
                                color: ageformcontroller.isBirthdaySelected
                                    .value ? Color(0xffAF6C46) : Colors
                                    .transparent),

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/2872396 1.png"),
                              Text("Birthday",style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),)),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Obx(() {
                      return InkWell(
                        onTap: () {
                          ageformcontroller.Event.value = "Anniversary";
                          r.eventSelection="Anniversary";
                          ageformcontroller.isBirthdaySelected.value = false;
                          ageformcontroller.isAnniversarySelected.value = true;
                          ageformcontroller.isOthersSelected.value = false;
                          ageformcontroller.isEventSelected.value=true;

                        },
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: ageformcontroller.isAnniversarySelected
                                .value ? Color(0xffEFE2DA):Color(0xffF4F4F4),
                            border: Border.all(color: ageformcontroller
                                .isAnniversarySelected.value
                                ? Color(0xffAF6C46)
                                : Colors.transparent),


                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/image 1.png"),
                              Text("Anniversary",style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),)),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Obx(() {
                      return InkWell(
                        onTap: () {
                          ageformcontroller.Event.value = "Others";
                          r.eventSelection="Others";
                          ageformcontroller.isBirthdaySelected.value = false;
                          ageformcontroller.isAnniversarySelected.value = false;
                          ageformcontroller.isOthersSelected.value = true;
                          ageformcontroller.isEventSelected.value=true;
                        },
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: ageformcontroller.isOthersSelected
                                .value ? Color(0xffEFE2DA):Color(0xffF4F4F4),
                            border: Border.all(color: ageformcontroller
                                .isOthersSelected.value
                                ? Color(0xffAF6C46)
                                : Colors.transparent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/image 2.png"),
                              Text("Others",style: GoogleFonts.lexend(textStyle: TextStyle(fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),)),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Visibility(
                visible: r.isFromResultSave ?? false,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffC07FFA),
                  ),
                  width: double.infinity,
                  height: 60,
                  child:  TextButton(
                      onPressed: () {
                        if (ageformcontroller.namecontroller.text.isNotEmpty && ageformcontroller.isEventSelected.value!=false && ageformcontroller.isGenderSelected.value!=false) {
                          ageformcontroller.upcomingbirthday.value = r.upcomingBirthday;
                          ageformcontroller.dateofbirth.value =r.DateOfBirthToCalculate;
                          ageformcontroller.yearsold.value = r.yearsOld!;
                          ageformcontroller.Save();

                          Get.offAllNamed(ScreenRouts.calculator);
                        }
                        else {
                          Get.snackbar("Error", "please enter all the details as one of the field is empty or not selected ",
                              backgroundColor:Color(0xffC07FFA),
                              colorText: Colors.white,
                              snackPosition: SnackPosition.TOP);
                        }
                      },
                      child: Text(
                        "Save",
                        style: GoogleFonts.lexend(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ),
                replacement:
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffC07FFA),
                  ),
                  width: double.infinity,
                  height: 60,
                  child: TextButton(
                      onPressed: () {
                        if (ageformcontroller.namecontroller.text.isNotEmpty &&
                            ageformcontroller.isEventSelected.value !=false && ageformcontroller.isGenderSelected.value!=false) {
                           ageformcontroller.Gender.value=r.userGender!;
                           ageformcontroller.Event.value=r.eventSelection!;
                          ageformcontroller.upcomingbirthday.value = r.upcomingBirthday;
                          ageformcontroller.dateofbirth.value = r.DateOfBirthToCalculate;
                          ageformcontroller.yearsold.value = r.yearsOld!;


                          print("${r.upcomingBirthday} - ${r.DateOfBirthToCalculate} - ${r.yearsOld}");

                          ageformcontroller.Update();

                          if(r.userPath == 'calculator') {
                            r.userPath = '';
                            Get.offAllNamed(ScreenRouts.calculator);
                          }
                          else {
                            Get.offAllNamed(ScreenRouts.favorite);
                          }

                        }
                        else {
                          Get.snackbar("Error", "please enter all the details as one of the field is empty or not selected ",
                              backgroundColor:Color(0xffC07FFA),
                              colorText: Colors.white,
                              snackPosition: SnackPosition.TOP,
                              duration: Duration(seconds: 1));
                        }
                      },
                      child: Text(
                        "Update",
                        style: GoogleFonts.lexend(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ),


              ),
            ],
          ),
        ),
      ),
    );
  }
}
