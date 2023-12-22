
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yatra1/location/locationsearch.dart';
import 'package:yatra1/location/search.dart';
import 'package:yatra1/screens/hotelbookscreen.dart';
import 'package:yatra1/screens/hotelscreen.dart';
import 'package:yatra1/screens/ticketview.dart';
import 'package:yatra1/utilis/app_styles.dart';
import 'package:yatra1/utilis/appinfo_list.dart';


import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget { 
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

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
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("Search bar tapped");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HotelHomeScreen(),
                                // builder: (context) => Search(
                                //   searchController: _searchController,
                                //   dateController: _dateController,
                                // ),
                              ),
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
                                  Icons.search, // Use the appropriate icon
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
