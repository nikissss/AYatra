import 'package:flutter/material.dart';
import 'package:yatra1/screens/bottom_bar.dart';

class ArticleTwo extends StatefulWidget {
  const ArticleTwo({super.key});

  @override
  State<ArticleTwo> createState() => _ArticleTwoState();
}

class _ArticleTwoState extends State<ArticleTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 121, 154, 1),
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
                    "From base camp to summit: The thrills and challenges of climbing high peaks",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: Image.asset('lib/assets/images/everest.jpg'),
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
                          "lib/assets/images/puja.jpg",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(" By Puja Kadayat   "),
                      const Text("-June 22, 2021"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 50, left: 50),
                  child: Text(
                    "The timeless allure of conquering towering peaks has captivated adventurers across the ages. Whether scaling the snow-capped majesty of the Himalayas or navigating the rugged terrain of the Andes, high-altitude mountaineering presents a captivating fusion of physical challenge and breathtaking natural beauty. Embarking on the ascent of towering peaks is a pursuit that requires meticulous planning, unwavering determination, and a deep-seated respect for the formidable power of nature. This article delves into the arduous journey from base camp to summit, providing insight into the unique thrills and daunting challenges that await those intrepid individuals who dare to undertake the ascent of the world's highest peaks. It is a narrative that unfolds against a backdrop of awe-inspiring landscapes and demands a profound connection with both the environment and one's inner strength, making high-altitude mountaineering an indelible chapter in the history of human exploration and endurance.",
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
