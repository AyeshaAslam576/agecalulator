import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreenController extends GetxController{
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    startTimer();
    super.onReady();
  }
  void startTimer() {
    Timer(Duration(seconds: 2), navigateToNextScreen);
  }
  void navigateToNextScreen() {
  }
}
