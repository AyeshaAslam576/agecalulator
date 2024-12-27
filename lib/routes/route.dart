import 'package:agecalculator/views/ageform.dart';
import 'package:agecalculator/views/calculator.dart';
import 'package:agecalculator/views/favorite.dart';
import 'package:agecalculator/views/results.dart';
import 'package:agecalculator/views/spalshscreen.dart';
import 'package:get/get.dart';
class ScreenRouts {
  static const String calculator = "/calculator";
  static const String results = "/results";
  static const String splashscreen = "/splashscreen";
  static const String ageform = "/ageform";
  static const String favorite = "/favorite";
  static final List<GetPage> mypages = [
    GetPage(name: calculator, page: () => Calculator()),
    GetPage(name: splashscreen, page: () => SplashSchreen()),
    GetPage(name: results, page: () {
       return Results();
    }),
    GetPage(name: ageform, page: (){return Ageform();
    }),
    GetPage(name: favorite, page: () => Favorite()),
  ];
}





