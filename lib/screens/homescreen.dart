import 'package:flutter/material.dart';
import 'package:yatra1/hoteldetail/roombookingscreen.dart';
import 'package:yatra1/screens/articles/aboutus.dart';
import 'package:yatra1/screens/articles/articleone.dart';
import 'package:yatra1/screens/articles/articletwo.dart';
import 'package:yatra1/screens/hotelscreen.dart';
import 'package:yatra1/screens/ticketview.dart';
import 'package:yatra1/utilis/app_styles.dart';
import 'package:yatra1/utilis/appinfo_list.dart';
import 'package:yatra1/utilis/applayout.dart';


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
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hello', style: Styles.headLinestyle3),
                          const SizedBox(height: 5),
                          Text('Welcome to Yatra', style: Styles.headLinestyle1),
                        ],
                      ),
                       Container(
                      height:50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                            "lib/assets/images/logo.png"
                          )
                        )
                      )
                     )
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ARTICLES",
                        style: Styles.headLinestyle2,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     print("you are tapped");
                      //   },
                      //   child: Text("View all", style: Styles.textstyle.copyWith(color: Styles.primaryColor)),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 15),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   padding: const EdgeInsets.only(left: 20),
            //   child: Row(
            //     children: ticketList.map((singleTicket) => TicketView(ticket: singleTicket)).toList(),
            //   ),
            // ),
            const SizedBox(height: 15,),
             Row(
              
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Padding(padding: EdgeInsets.only(left:10)),
              Container(
                height: 350,
                width: size.width * 0.51,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(224, 204, 151, 1),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 1,
                        spreadRadius: 1,
                      )
                    ]),
                child: Column(children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: AssetImage("lib/assets/images/engfeather.png"))),
                  ),
                  const SizedBox(height: 10,),
                  GestureDetector(
                    child: Text("A Traveller Guide To Yatra App : About Us",
                        style: Styles.headLinestyle2),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => AboutUs()));
                    },
                  )
                ]),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width * 0.48,
                        height: 166,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(77, 137, 99, 1),
                            borderRadius: BorderRadius.circular(18)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                child: Text(
                                  "8 Things To   \n Do In Nepal",
                                  style: Styles.headLinestyle2.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ArticleOne()));
                                }),
                            const SizedBox(height: 10),
                            Text(
                                "The global trend is shifting towards a cashless ..read more",
                                style: Styles.headLinestyle2.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 13)),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -45,
                        top: -40,
                        child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 18, color: Color(0xFF189999)),
                            color: Colors.transparent,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    width: size.width * 0.48,
                    height: 166,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color.fromRGBO(159, 2, 81, 1)),
                    child: Column(
                      children: [
                        GestureDetector(
                            child: Text(
                              "From base camp to summit: The thrills",
                              style: Styles.headLinestyle2.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ArticleTwo()));
                            }),
                      ],
                    ),
                  )
                ],
              )
            ],
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
                  // InkWell(
                  //   onTap: () {
                  //     print("you are tapped");
                  //   },
                  //   child: Text("View all", style: Styles.textstyle.copyWith(color: Styles.primaryColor)),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   padding: const EdgeInsets.only(left: 20),
            //   child: Row(
            //     children: hotelList.map((singleHotel) => HotelScreen(hotel: singleHotel)).toList(),
            //   ),
            // ),
            SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  padding: const EdgeInsets.only(left: 20),
  child: Row(
    children: hotelList.map((singleHotel) {
      return InkWell(
        onTap: () {
          // Handle the onTap event
          Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomBookingScreen(hotelTitle: '', hotelName: '',),
      ),
    );
        },
        child: HotelScreen(hotel: singleHotel),
      );
    }).toList(),
  ),
),

          ],
        ),
      ),
    );
  }
}
