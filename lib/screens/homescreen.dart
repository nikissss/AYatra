
// import 'package:fluentui_icons/fluentui_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:yatra1/location/locationsearch.dart';

// import 'package:yatra1/screens/hotelscreen.dart';
// import 'package:yatra1/screens/ticketview.dart';
// import 'package:yatra1/utilis/app_styles.dart';
// import 'package:yatra1/utilis/appinfo_list.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Styles.bgColor,
//       body: ListView(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                    Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Good Morning', style: Styles.headLinestyle3),
//                         const SizedBox(height: 5),
//                         Text('Book Tickets', style: Styles.headLinestyle1),
//                       ],
//                     ),
//                     Container(
//                       height: 50,
//                       width: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: const DecorationImage(
//                           fit: BoxFit.fitHeight,
//                           image: AssetImage("lib/images/img_1.png"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 25),
//                 GestureDetector(
//   onTap: () {
//     // Navigate to the search screen when the search bar is tapped
//    const GoogleMapController mapController= GoogleMapController; 
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (context) {
//         return LocationSearch(mapController: mapController,); // Replace 'SearchScreen' with the name of your search screen
//       }),
//     );
//   },
//   child: Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: const Color(0xFFF4F6FD),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.05),
//           spreadRadius: 4,
//           blurRadius: 10,
//         ),
//       ],
//     ),
//     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//     child: TextFormField(
//       decoration: const InputDecoration(
//         hintText: 'Search your destination',
//         prefixIcon: Icon(
//           FluentSystemIcons.ic_fluent_search_regular,
//           color: Color(0xFFBFC205),
//         ),
//       ),
//     ),
//   ),
// )

// //                Container(
// //   decoration: BoxDecoration(
// //     borderRadius: BorderRadius.circular(10),
// //     color: const Color(0xFFF4F6FD),
// //     boxShadow: [
// //       BoxShadow(
// //         color:Colors.black.withOpacity(0.05),
// // spreadRadius:4,
// // blurRadius:10)
// //     ],
    
// //   ),
// //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
// //   child: TextFormField(
// //     decoration: const InputDecoration(
// //       hintText: 'Search your destination',
// //       prefixIcon: Icon(
// //         FluentSystemIcons.ic_fluent_search_regular,
// //         color: Color(0xFFBFC205),
// //       ),
// //     ),
// //   ),
// // ),
// ,
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Upcoming Flights",
//                       style: Styles.headLinestyle2,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         print("you are tapped");
//                       },
//                       child: Text("View all", style: Styles.textstyle.copyWith(color: Styles.primaryColor)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 15),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: ticketList.map((singleTicket) => TicketView(ticket: singleTicket)).toList(),
//             ),
//           ),
//           const SizedBox(height: 15),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Hotels",
//                   style: Styles.headLinestyle2,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     print("you are tapped");
//                   },
//                   child: Text("View all", style: Styles.textstyle.copyWith(color: Styles.primaryColor)),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 15),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: hotelList.map((singleHotel) => HotelScreen(hotel: singleHotel)).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yatra1/location/locationsearch.dart';
import 'package:yatra1/location/search.dart';

import 'package:yatra1/screens/hotelscreen.dart';
import 'package:yatra1/screens/ticketview.dart';
import 'package:yatra1/utilis/app_styles.dart';
import 'package:yatra1/utilis/appinfo_list.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List searchResult = [];

//   void searchFromFirebase(String query) async {
//     final result = await FirebaseFirestore.instance
//         .collection('location')
//         .where('loc-title', isEqualTo: query)
//         .get();

//     setState(() {
//       searchResult = result.docs.map((e) => e.data()).toList();
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Styles.bgColor,
//       body: ListView(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                    Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Good Morning', style: Styles.headLinestyle3),
//                         const SizedBox(height: 5),
//                         Text('Book Tickets', style: Styles.headLinestyle1),
//                       ],
//                     ),
//                     Container(
//                       height: 50,
//                       width: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: const DecorationImage(
//                           fit: BoxFit.fitHeight,
//                           image: AssetImage("lib/images/img_1.png"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 25),
//                GestureDetector(
//   onTap: () async {
//     // Navigate to the search screen when the search bar is tapped
//     var mapController;
//     if (mapController != null) {
//       Navigator.of(context).push(
//         MaterialPageRoute(builder: (context) {
//           return LocationSearch(mapController: mapController!);
//         }),
//       );
//     } else {
//       // Handle the case where mapController is null, e.g., show an error message.
//       print('GoogleMapController is null. Cannot proceed.');
//     }
//   },
//   child: Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: const Color(0xFFF4F6FD),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.05),
//           spreadRadius: 4,
//           blurRadius: 10,
//         ),
//       ],
//     ),
//     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//     child: TextFormField(
//       decoration: const InputDecoration(
//         hintText: 'Search your destination',
//         prefixIcon: Icon(
//           FluentSystemIcons.ic_fluent_search_regular,
//           color: Color(0xFFBFC205),
//         ),
//       ),
//       onChanged: (query) {
//         searchFromFirebase(query);
//       },
//     ),
//   ),
// ),
// Expanded(
//   child: searchResult.isNotEmpty
//       ? ListView.builder(
//           itemCount: searchResult.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(searchResult[index]['loc-title'] ?? ''),
//             );
//           },
//         )
//       : Center(
//           child: Text('No search results found'), // Display a message when no results are available
//         ),
// ),
         

//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Upcoming Flights",
//                       style: Styles.headLinestyle2,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         print("you are tapped");
//                       },
//                       child: Text("View all", style: Styles.textstyle.copyWith(color: Styles.primaryColor)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 15),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: ticketList.map((singleTicket) => TicketView(ticket: singleTicket)).toList(),
//             ),
//           ),
//           const SizedBox(height: 15),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Hotels",
//                   style: Styles.headLinestyle2,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     print("you are tapped");
//                   },
//                   child: Text("View all", style: Styles.textstyle.copyWith(color: Styles.primaryColor)),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 15),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: hotelList.map((singleHotel) => HotelScreen(hotel: singleHotel)).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List searchResult = [];

//   void searchFromFirebase(String query) async {
//     final result = await FirebaseFirestore.instance
//         .collection('location')
//         .where('loc-titlearr', isEqualTo: query)
//         .get();

//     setState(() {
//       searchResult = result.docs.map((e) => e.data()).toList();
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Styles.bgColor,
//       body: ListView(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Good Morning', style: Styles.headLinestyle3),
//                         const SizedBox(height: 5),
//                         Text('Book Tickets', style: Styles.headLinestyle1),
//                       ],
//                     ),
//                     Container(
//                       height: 50,
//                       width: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: const DecorationImage(
//                           fit: BoxFit.fitHeight,
//                           image: AssetImage("lib/images/img_1.png"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 25),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: const Color(0xFFF4F6FD),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         spreadRadius: 4,
//                         blurRadius: 10,
//                       ),
//                     ],
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       hintText: 'Search your destination',
//                       prefixIcon: Icon(
//                         FluentSystemIcons.ic_fluent_search_regular,
//                         color: Color(0xFFBFC205),
//                       ),
//                     ),
//                     onChanged: (query) {
//                       searchFromFirebase(query);
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Upcoming Flights",
//                       style: Styles.headLinestyle2,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         print("you are tapped");
//                       },
//                       child: Text("View all", style: Styles.textstyle.copyWith(color: Styles.primaryColor)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 15),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: ticketList.map((singleTicket) => TicketView(ticket: singleTicket)).toList(),
//             ),
//           ),
//           const SizedBox(height: 15),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Hotels",
//                   style: Styles.headLinestyle2,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     print("you are tapped");
//                   },
//                   child: Text("View all", style: Styles.textstyle.copyWith(color: Styles.primaryColor)),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 15),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: hotelList.map((singleHotel) => HotelScreen(hotel: singleHotel)).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
// Make sure to import the correct file for the Search widget

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good Morning', style: Styles.headLinestyle3),
          const SizedBox(height: 5),
          Text('Book Tickets', style: Styles.headLinestyle1),
        ],
          ),
          Expanded( // Wrap the GestureDetector with Expanded
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Search()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF4F6FD),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search your destination',
                prefixIcon: Icon(
                  FluentSystemIcons.ic_fluent_search_regular,
                  color: Color(0xFFBFC205),
                ),
              ),
            ),
          ),
        ),
          ),
        ],
      ),
      
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming Flights",
                        style: Styles.headLinestyle2,
                      ),
                      InkWell(
                        onTap: () {
                          print("you are tapped");
                        },
                        child: Text("View all", style: Styles.textstyle.copyWith(color: Styles.primaryColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: ticketList.map((singleTicket) => TicketView(ticket: singleTicket)).toList(),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hotels",
                    style: Styles.headLinestyle2,
                  ),
                  InkWell(
                    onTap: () {
                      print("you are tapped");
                    },
                    child: Text("View all", style: Styles.textstyle.copyWith(color: Styles.primaryColor)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: hotelList.map((singleHotel) => HotelScreen(hotel: singleHotel)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

