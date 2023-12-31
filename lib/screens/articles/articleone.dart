import 'package:flutter/material.dart';
import 'package:yatra1/screens/bottom_bar.dart';

class ArticleOne extends StatefulWidget {
  const ArticleOne({super.key});

  @override
  State<ArticleOne> createState() => _ArticleOneState();
}

class _ArticleOneState extends State<ArticleOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 114, 148, 1),
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
                    "8 Things to Do in Nepal for A Memorable Vacation",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: Image.asset('lib/assets/images/rafting.png'),
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
                          "lib/assets/images/sid2.jpg",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(" By Siddhant Khadka   "),
                      const Text("-Janaury 11, 2024"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 50, left: 50),
                  child: Text(
                    "The global trend is shifting towards a cashless mode of financial transactions due to the increasing popularity of mobile transactions. Online activities, facilitated by smartphones, are becoming the norm. As people seek convenient and comfortable travel experiences, this project aims to contribute to that goal.The Flight and Hotel Reservation System is a comprehensive solution with dynamic features essential for efficient management of airline and accommodation businesses. This integrated system connects reservation, guest history, front desk operations, sales ledger, accounting, and reporting modules, ensuring a seamless operational flow. It generates insightful reports analyzing booking statuses, check-ins, and checkouts, optimizing resource management, and enhancing revenue generation.",
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
