import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:yatra1/providers/theme_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yatra1/screens/hotelbookscreen.dart';
import 'package:yatra1/utilis/hotel_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yatra1/firebase_options.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yatra1/views/login_page.dart';
import 'package:yatra1/views/registerpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
  
//    // Replace null with the actual value or implementation.

// //   Positioned(
// //   key: UniqueKey(), // Use UniqueKey to ensure each Positioned has a unique identity
// //   // other properties of Positioned...
// // )

  

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//      TextEditingController _searchController = TextEditingController();
//         TextEditingController _datecontroller = TextEditingController();
//      DateTime initialStartDate = DateTime.now();

//     // Get.put(LocationController());
//     return GetMaterialApp(
      
//       debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
//       theme: HotelTheme.buildLightTheme(),
//       // debugShowCheckedModeBanner:false,
//       // home: BookingForm(),
// // home: Loginpage(onTap: onTap, context: context)
// //  home: Search(searchController: _searchController, dateController: _datecontroller, controller: _searchController),
// //  home:FilterBarUI(),
//       // Loginpage(onTap: onTap, context: context),
//       // home: HomeScreen(),a
//       // home:SearchScreen(),
//    home:const HotelHomeScreen(),
// //  home:FiltersScreen(),
// // home:TimeDateView(),

//     );
//   }

//   onTap() {
//   }
// }

class MyApp extends StatelessWidget {
 MyApp({Key? key});
  
  final nameController = TextEditingController();
    final emailController = TextEditingController();

  get onTap => null;

  @override
  Widget build(BuildContext context) {
    var roomData;
    var animationController;
    var animation;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(applicationcontext: context),
        ),
        // Add other providers as needed
        // Example: ChangeNotifierProvider<OtherProvider>(
        //   create: (context) => OtherProvider(),
        // ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
       
        theme: HotelTheme.buildLightTheme(),
   home: Loginpage(onTap: onTap, context: context)
        // Your app configuration
  //  home: const HotelHomeScreen(),
    // home:RegisterPage(onTap: onTap, context: context)
      // home:RoomeBookView(roomData: roomData, animationController: animationController, animation: animation)
        // home:HotelListView(),
          // home:FiltersScreen(),
      ),
    );
  }
}
