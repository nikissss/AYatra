import 'package:flutter/material.dart';
import 'package:yatra1/screens/bottom_bar.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(225, 179, 120, 1),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          GestureDetector(
            child: Text("Home", style: TextStyle(fontSize: 15)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => BottomBar()));
            },
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xfff9fafa),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Yatra: About us",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: Image.asset('lib/assets/images/paint.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "lib/assets/images/nikki.jpg",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(" By Nikki Kayastha  "),
                      const Text("-December 22, 2023"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 50, left: 50),
                  child: Text(
                    "Yatra is a comprehensive travel app designed to streamline and enhance your travel experience. This all-in-one platform seamlessly integrates airline ticket booking and hotel reservations, offering users a convenient and efficient solution for their travel needs. With Yatra, users can effortlessly search, compare, and book flights to their desired destinations, ensuring a hassle-free booking process. Additionally, the app extends its functionality to hotel accommodations, allowing users to find and reserve lodging that suits their preferences and budget. Yatra's user-friendly interface and intuitive design make it easy for travelers to plan and manage their trips, providing a one-stop solution for both flights and accommodation, ultimately enhancing the overall travel booking experience. Welcome to the Community <3.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(238, 241, 242, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'comment...',
                          hintStyle: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ]),
      )),
    );
  }
}
