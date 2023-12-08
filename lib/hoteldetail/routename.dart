import 'package:flutter/material.dart';
import 'package:yatra1/utilis/hotellistdata.dart';

import 'package:yatra1/hoteldetail/filterscreen/filterscreen.dart';
// import 'package:yatra1/hotel_home_screen.dart';
import 'package:yatra1/hoteldetail/hotel_details.dart';
import 'package:yatra1/hoteldetail/reviewlistscreen.dart';
import 'package:yatra1/hoteldetail/roombookingscreen.dart';
import 'package:yatra1/hoteldetail/searchscreen.dart';


import 'package:yatra1/hoteldetail/routes.dart';

class NavigationServices {
  NavigationServices(this.context);

  final BuildContext context;

  Future<dynamic> _pushMaterialPageRoute(Widget widget,
      {bool fullscreenDialog: false}) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => widget, fullscreenDialog: fullscreenDialog),
    );
  }

  // void gotoSplashScreen() {
  //   Navigator.pushNamedAndRemoveUntil(
  //       context, RoutesName.Splash, (Route<dynamic> route) => false);
  // }

  // void gotoIntroductionScreen() {
  //   Navigator.pushNamedAndRemoveUntil(context, RoutesName.IntroductionScreen,
  //       (Route<dynamic> route) => false);
  // }

  // Future<dynamic> gotoLoginScreen() async {
  //   return await _pushMaterialPageRoute(LoginScreen());
  // }

  // Future<dynamic> gotoTabScreen() async {
  //   return await _pushMaterialPageRoute(BottomTabScreen());
  // }

  // Future<dynamic> gotoSignScreen() async {
  //   return await _pushMaterialPageRoute(SignUpScreen());
  // }

  // Future<dynamic> gotoForgotPassword() async {
  //   return await _pushMaterialPageRoute(ForgotPasswordScreen());
  }

  Future<dynamic> gotoSearchScreen() async {
    return await _pushMaterialPageRoute(SearchScreen());
  }

  Future<dynamic> gotoHotelHomeScreen() async {
    return await _pushMaterialPageRoute(HotelHomeScreen());
  }

  Future<dynamic> gotoFiltersScreen() async {
    return await _pushMaterialPageRoute(FiltersScreen());
  }

  Future<dynamic> gotoRoomBookingScreen(String hotelname) async {
    return await _pushMaterialPageRoute(
        RoomBookingScreen(hotelName: hotelname));
  }

  Future<dynamic> gotoHotelDetailes(HotelListData hotelData) async {
    return await _pushMaterialPageRoute(HotelDetailes(
      hotelData: hotelData,
    ));
  }

  Future<dynamic> gotoReviewsListScreen() async {
    return await _pushMaterialPageRoute(ReviewsListScreen());
  }
}