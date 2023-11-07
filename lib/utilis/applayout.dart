import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AppLayout{
  static getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
  static getScreenHeight(){
    return Get.height;
  }
  static getScreenWidth(){
    return Get.width;
  }
static getHeight(double pixels) {
  double? screenHeight = Get.height;

  if (screenHeight != null && pixels > 0) {
    double x = screenHeight / pixels; // Perform division
    return screenHeight / x;
  } else {
    // Handle the case where Get.height is null or pixels is not valid
    return 0.0; // You can return a default value or handle the error accordingly
  }
}

static getWidth(double pixels){
  double x= getScreenWidth()/pixels;
  return getScreenWidth()/x;
}


}

