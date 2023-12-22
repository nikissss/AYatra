
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:yatra1/Profile/profile_screen.dart';
import 'package:yatra1/providers/theme_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yatra1/screens/bottom_bar.dart';
import 'package:yatra1/screens/homescreen.dart';
import 'package:yatra1/screens/hotelbookscreen.dart';
import 'package:yatra1/screens/hotellistview.dart';
import 'package:yatra1/mytrips/mytrips.dart';
import 'package:yatra1/utilis/app_styles.dart';
import 'package:yatra1/utilis/hotel_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yatra1/firebase_options.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yatra1/views/login_page.dart';
import 'package:yatra1/views/registerpage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({Key? key});
  

  //  final AnimationController animationController = AnimationController(
  //   duration: Duration(milliseconds: 500),
  //   vsync: ScrollableState(),
  //   );

  final nameController = TextEditingController();
    final emailController = TextEditingController();

  // get onTap => null;

  @override
  Widget build(BuildContext context) {
    var roomData;
   
    // var animation;
    var animationController;
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
       
//         theme: HotelTheme.buildLightTheme(),
// home: Loginpage(onTap: onTap, context: context)
theme: ThemeData( 
        primaryColor: primary,
      ),
      home:  AnimatedSplashScreen(
        splash:  Transform.scale(
    scale: 3.0, // Adjust the scale factor as needed
    child: Image.asset('assets/images/yatra.png'),
  ),
        //Image.asset('assets/images/yatra.png'),
        duration: 2000,
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Colors.grey, 
        nextScreen: Loginpage(onTap: () {  },context: context,),
        ),
        // Your app configuration
//home: const HotelHomeScreen(),
    // home:RegisterPage(onTap: onTap, context: context)
     // home:RoomeBookView(roomData: roomData, animationController: animationController, animation: animation)
        // home:HotelListView(),
          // home:FiltersScreen(),
         // home:HotelListView()
     // home:HomeScreen()
    // home:BottomBar()
    // home:MyTripsScreen(animationController: animationController)
    // home:MyTripsScreen(animationController: animationController)
    //home:ProfileScreen(animationController:animationController)
      ),
    );
  }

  onTap() {
  }
}


// import 'dart:collection';
// import 'package:flutter/material.dart';
// import 'package:yatra1/mytrips/favouritelist.dart';
// import 'package:yatra1/mytrips/mytrips.dart';
// import 'package:yatra1/providers/theme_provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:yatra1/screens/bottom_bar.dart';
// import 'package:yatra1/screens/homescreen.dart';
// import 'package:yatra1/screens/hotelbookscreen.dart';
// import 'package:yatra1/screens/hotellistview.dart';
// import 'package:yatra1/utilis/hotel_theme.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:yatra1/firebase_options.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:yatra1/views/login_page.dart';
// import 'package:yatra1/views/registerpage.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options:DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp( MyApp());
// }

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
//     var animationController;
//     return GetMaterialApp(
      
//       debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
//       theme: HotelTheme.buildLightTheme(),
//       // debugShowCheckedModeBanner:false,
//       // home: BookingForm(),
// home: Loginpage(onTap: onTap, context: context)
// //  home: Search(searchController: _searchController, dateController: _datecontroller, controller: _searchController),
// //  home:FilterBarUI(),
//       // Loginpage(onTap: onTap, context: context),
//       // home: HomeScreen(),a
//       // home:SearchScreen(),
//    //home:const HotelHomeScreen(),
// //  home:FiltersScreen(),
// // home:TimeDateView(),
// //home:const BottomBar()
// //home:FavoritesListView(animationController: animationController)
//     );
//   }

//   onTap() {
//   }
// }


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//    runApp(
//      MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: HotelTheme.buildLightTheme(),
//       home: MultiProvider(
//         providers: [
//           ChangeNotifierProvider<ThemeProvider>(
//             create: (context) => ThemeProvider(applicationcontext: context),
//           ),
//           // Add other providers if needed
//         ],
//       child: MyApp(),
//     ),
//     ) );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: HotelTheme.buildLightTheme(),
//   //home: BottomBar(),
//    home: Loginpage(onTap: onTap, context: context),
//      // home:EditProfile()
//     );
//   }
//   onTap() {
//    }
// }
