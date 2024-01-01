// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:yatra1/Dashboard/drawermobile.dart';

// class MobileScreen extends StatelessWidget {
//   final User? user;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   int authenticatedUsersCount = 0;
//   MobileScreen({Key? key, required this.user}) : super(key: key) {
//     // Initialization logic can go here
//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user != null) {
//         // Update the UI with the count of logged-in users
//         updateActiveUsersCount(user.uid);
//       }
//     });
//   }

//   void updateActiveUsersCount(String userId) async {
//     // Fetch the count of active users and update the UI
//     QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
//         .collection('active_users')
//         .where('status', isEqualTo: 'active')
//         .get();

//     int activeUsersCount = querySnapshot.size;
//     print('Active Users Count: $activeUsersCount');
//   }

//   Future<int> fetchBookingsCount() async {
//     // Replace 'bookings' with the actual name of your Firestore collection
//     QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
//         .collection('bookings')
//         .get();

//     int bookingsCount = querySnapshot.size;
//     return bookingsCount;
//   }

//   Future<int> fetchAuthenticatedUsersCount() async {
//     // Replace 'users' with the actual name of your Firestore collection for users
//     QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .get();

//     int authenticatedUsersCount = querySnapshot.size;
//     return authenticatedUsersCount;
//   }

//   Future<int> fetchFlightBookingsCount() async {
//     // Replace 'flight_bookings' with the actual name of your Firestore collection for flight bookings
//     QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
//         .collection('flight_bookings')
//         .get();

//     int flightBookingsCount = querySnapshot.size;
//     return flightBookingsCount;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveBuilder(
//       builder: (_, sizingInformation) {
//         return Scaffold(
//           key: scaffoldKey,
//           appBar: AppBar(
//             leading: GestureDetector(
//               onTap: () {
//                 scaffoldKey.currentState?.openDrawer();
//               },
//               child: const Icon(Icons.menu),
//             ),
//             title: const Text("Dashboard"),
//             actions: const [
//               Icon(Icons.more_vert),
//             ],
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 _upgradeToProWidget(),
//                 FutureBuilder(
//                   // Fetch data from Firestore here
//                   future: fetchBookingsCount(),
//                   builder: (context, bookingsSnapshot) {
//                     if (bookingsSnapshot.connectionState == ConnectionState.waiting) {
//                       return CircularProgressIndicator();
//                     } else if (bookingsSnapshot.hasError) {
//                       return Text('Error: ${bookingsSnapshot.error}');
//                     } else {
//                       return FutureBuilder(
//                         // Fetch flight booking count from Firestore here
//                         future: fetchFlightBookingsCount(),
//                         builder: (context, flightBookingsSnapshot) {
//                           if (flightBookingsSnapshot.connectionState == ConnectionState.waiting) {
//                             return CircularProgressIndicator();
//                           } else if (flightBookingsSnapshot.hasError) {
//                             return Text('Error: ${flightBookingsSnapshot.error}');
//                           } else {
//                             return _row2by2Widget(
//                               sizingInformation,
//                               {
//                                 'totalBookings': bookingsSnapshot.data,
//                                 'totalAuthenticatedUsers': authenticatedUsersCount,
//                                 'myBookings': flightBookingsSnapshot.data,
//                               },
//                             );
//                           }
//                         },
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _upgradeToProWidget() {
//     return Container(
//       margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8),
//         ),
//         color: Colors.indigo,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Upgrade\nto PRO",
//                 style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "For more Profile Control",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 50,
//             width: 50,
//             // child: Image.asset("assets/pro.png"),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _row2by2Widget(
//       SizingInformation sizingInformation, Map<String, dynamic>? data) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: _singleItemQuickStats(
//                   title: "Total Bookings",
//                   value: data?['totalBookings'].toString() ?? '0',
//                   width: sizingInformation.screenSize.width / 2.6,
//                   icon: Icons.book_online,
//                   iconColor: Colors.black,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: _singleItemQuickStats(
//                   title: "Total Active Users",
//                   // Fetch the count of logged-in users here
//                   value: data?['totalAuthenticatedUsers'].toString() ?? '0',
//                   icon: Icons.verified_user_rounded,
//                   iconColor: Colors.black,
//                   width: sizingInformation.screenSize.width / 2.6,
//                   textColor: Colors.red,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: _singleItemQuickStats(
//                   title: "My Bookings",
//                   value: data?['myBookings'].toString() ?? '0',
//                   width: sizingInformation.screenSize.width / 2.6,
//                   icon: Icons.flight,
//                   iconColor: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _singleItemQuickStats({
//     required String title,
//     Color textColor = Colors.black,
//     required String value,
//     required IconData icon,
//     required double width,
//     required Color iconColor,
//   }) {
//     return Container(
//       width: width,
//       height: 110,
//       padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(8)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(.2),
//             spreadRadius: 2,
//             offset: const Offset(0.5, 0.5),
//             blurRadius: 2,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             style: TextStyle(color: textColor, fontSize: 14),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           icon == null
//               ? Text(
//                   value,
//                   style: const TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold),
//                 )
//               : Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       value,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Icon(
//                       icon,
//                       color: iconColor,
//                     )
//                   ],
//                 ),
//         ],
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:yatra1/Dashboard/drawermobile.dart';

class MobileScreen extends StatelessWidget {
  final User? user;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  //GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); 
  int authenticatedUsersCount = 0;

  MobileScreen({Key? key, required this.user}) : super(key: key) {
    // Initialization logic can go here
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        // Update the UI with the count of logged-in users
        updateActiveUsersCount(user.uid);
      }
    });
  }

  void updateActiveUsersCount(String userId) async {
    // Fetch the count of active users and update the UI
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('active_users')
            .where('status', isEqualTo: 'active')
            .get();

    int activeUsersCount = querySnapshot.size;
    print('Active Users Count: $activeUsersCount');
  }

  Future<int> fetchBookingsCount() async {
    // Replace 'bookings' with the actual name of your Firestore collection
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('bookings').get();

    int bookingsCount = querySnapshot.size;
    return bookingsCount;
  }

  Future<int> fetchAuthenticatedUsersCount() async {
    // Replace 'users' with the actual name of your Firestore collection for users
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    int authenticatedUsersCount = querySnapshot.size;
    return authenticatedUsersCount;
  }

  Future<int> fetchFlightBookingsCount() async {
    // Replace 'flight_bookings' with the actual name of your Firestore collection for flight bookings
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('flight_bookings').get();

    int flightBookingsCount = querySnapshot.size;
    return flightBookingsCount;
  }

  void _logout(BuildContext context) async {
    bool isOk = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Are you sure?"),
          content: const Text("You want to Sign Out."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // User pressed No
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // User pressed Yes
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );

    if (isOk == true) {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pop(); // Close the current screen
    }
  }


  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, sizingInformation) {
        return Scaffold(
          key: scaffoldKey,
          drawer: const DrawerMobile(user: null,),
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: const Icon(Icons.menu),
            ),
//             leading: InkWell(
//   onTap: () {
//     scaffoldKey.currentState?.openDrawer();
//     // DrawerMobile(user: user);
//   },
//   child: const Icon(Icons.menu),
// ),

            title: const Text("Dashboard"),
            actions: [
              IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () => _logout(context),
              ),
              // const Icon(Icons.more_vert),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _upgradeToProWidget(),
                FutureBuilder(
                  // Fetch data from Firestore here
                  future: fetchBookingsCount(),
                  builder: (context, bookingsSnapshot) {
                    if (bookingsSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (bookingsSnapshot.hasError) {
                      return Text('Error: ${bookingsSnapshot.error}');
                    } else {
                      return FutureBuilder(
                        // Fetch flight booking count from Firestore here
                        future: fetchFlightBookingsCount(),
                        builder: (context, flightBookingsSnapshot) {
                          if (flightBookingsSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (flightBookingsSnapshot.hasError) {
                            return Text(
                                'Error: ${flightBookingsSnapshot.error}');
                          } else {
                            return _row2by2Widget(
                              sizingInformation,
                              {
                                'totalBookings': bookingsSnapshot.data,
                                'totalAuthenticatedUsers':
                                    authenticatedUsersCount,
                                'myBookings': flightBookingsSnapshot.data,
                              },
                            );
                          }
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _upgradeToProWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.indigo,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upgrade\nto PRO",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "For more Profile Control",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            width: 50,
            // child: Image.asset("assets/pro.png"),
          )
        ],
      ),
    );
  }

  Widget _row2by2Widget(
      SizingInformation sizingInformation, Map<String, dynamic>? data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _singleItemQuickStats(
                  title: "Total Bookings",
                  value: data?['totalBookings'].toString() ?? '0',
                  width: sizingInformation.screenSize.width / 2.6,
                  icon: Icons.book_online,
                  iconColor: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _singleItemQuickStats(
                  title: "Total Active Users",
                  // Fetch the count of logged-in users here
                  value:
                      data?['totalAuthenticatedUsers'].toString() ?? '0',
                  icon: Icons.verified_user_rounded,
                  iconColor: Colors.black,
                  width: sizingInformation.screenSize.width / 2.6,
                  textColor: Colors.red,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _singleItemQuickStats(
                  title: "My Bookings",
                  value: data?['myBookings'].toString() ?? '0',
                  width: sizingInformation.screenSize.width / 2.6,
                  icon: Icons.flight,
                  iconColor: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget _singleItemQuickStats({
    required String title,
    Color textColor = Colors.black,
    required String value,
    required IconData icon,
    required double width,
    required Color iconColor,
  }) {
    return Container(
      width: width,
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            spreadRadius: 2,
            offset: const Offset(0.5, 0.5),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: textColor, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          icon == null
              ? Text(
                  value,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      icon,
                      color: iconColor,
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
