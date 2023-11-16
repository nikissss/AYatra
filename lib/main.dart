import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:yatra1/location/locationsearch.dart';
import 'package:yatra1/location/search.dart';
import 'package:yatra1/screens/bottom_bar.dart';
import 'package:yatra1/screens/homescreen.dart';

import 'package:yatra1/utilis/app_styles.dart';
import 'package:yatra1/views/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yatra1/firebase_options.dart';
import 'package:yatra1/views/home_page.dart';
import 'package:yatra1/views/login_page.dart';
import 'package:yatra1/views/registerpage.dart';
import 'package:get/get.dart';
import 'package:yatra1/constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//   Positioned(
//   key: UniqueKey(), // Use UniqueKey to ensure each Positioned has a unique identity
//   // other properties of Positioned...
// )

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.put(LocationController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     title: 'Flutter Demo',
      theme: ThemeData(
       primaryColor: primary,
        useMaterial3: true,
      ),
      home: HomeScreen(),
      // Loginpage(onTap: onTap, context: context),

    );
  }

  onTap() {
  }
}


