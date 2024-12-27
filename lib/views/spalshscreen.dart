import 'package:agecalculator/routes/route.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashSchreen extends StatelessWidget {
  const SplashSchreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors:[
                Color(0xff83509B),
                Color(0xff5974D8),
              ]
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Image.asset("assets/splash.png")),
                Text("How Old Am I ?",style: GoogleFonts.lexend(
                    textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 36),
                ),),
                Text("Check your current age based upon your date of birth", textAlign:TextAlign.center,style: GoogleFonts.lexend(
                  textStyle: TextStyle(color: Colors.white, fontSize: 18),
                ),),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: FloatingActionButton(onPressed:
                      (){
                        Get.offNamed(ScreenRouts.calculator);
                      },
                    backgroundColor: Colors.black.withOpacity(0.2),
                    tooltip: "Continue",
                    elevation: 0,
                    child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
