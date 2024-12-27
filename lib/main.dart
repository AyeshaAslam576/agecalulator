import 'package:agecalculator/routes/route.dart';
import 'package:agecalculator/views/spalshscreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(DevicePreview(
      builder: (context) => MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: ScreenRouts.splashscreen,

      getPages: ScreenRouts.mypages,
    );
  }
}

