import 'package:agecalculator/controllers/favouritecontroller.dart';
import 'package:agecalculator/routes/route.dart';
import 'package:agecalculator/singleton/singleTond.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class Favorite extends StatelessWidget {
  Favorite({super.key});
 final Favouritecontroller favouritecontroller=Get.put(Favouritecontroller());
  SingleTon r = SingleTon();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.offNamed(ScreenRouts.calculator);
        }, icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,)),
        title: Text(
          "My Favorite", style: GoogleFonts.lexend(textStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w300,
          fontSize: 20,
        )),),
        elevation: 0,
      ),
      body: Obx(() {
        return Visibility(
            visible:  favouritecontroller.Lenght.value>=1 ,
            child:ListView.builder(
                itemCount: favouritecontroller.user.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  final user=favouritecontroller.user[index];
                  final upcoming=DateFormat("dd-MM-yyyy").format(user.upcomingDateOfBirth);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
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
                        title:
                        Text(
                            user.userName,style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
                        )  ),
                        tileColor: user.gender == "Male" ? Color(0xff7473E2).withOpacity(0.2)
                            : Color(0xffC07FFA).withOpacity(0.2),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("${user.yearsOld} ",style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16,
                                  ),
                                ),),
                                Text(" Years Old",style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,fontSize: 14,
                                  ),
                                ),),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                Text("Upcoming:",style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,fontSize: 14,
                                  ),
                                ),),
                                Text("${upcoming} ",style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14,
                                  ),
                                ),),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          r.userId=user.id;
                          r.isFromFav = true;
                          r.isFromAgeCalculator = false;
                          r.userName=user.userName;
                          r.eventSelection=user.event;
                          r.userGender=user.gender;
                          r.DateOfBirthToCalculate=user.dateOfBirth;
                          r.creationDate=user.createdDate;
                          r.eventSelection=user.event;
                          print("Fetched date is ${r.creationDate}");
                          Get.offNamed(ScreenRouts.results);
                        },

                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        trailing:  Icon(Icons.arrow_forward_ios)),

                  );
                }),
          replacement: Center(child:
            Text("Record not found!",style: TextStyle(fontSize: 30),),),

        );
      }),
    );
  }
}
