
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:yatra1/screens/hotelscreen.dart';
import 'package:yatra1/screens/ticketview.dart';
import 'package:yatra1/utilis/app_styles.dart';
import 'package:yatra1/utilis/appinfo_list.dart';



 class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
   Widget build(BuildContext context) {
     return Scaffold(
     backgroundColor: Styles.bgColor,
     body: ListView(
        children: [
         Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
           child:  Column(
              children: [
                const SizedBox(height: 40), // Adds a vertical space of 10 pixels

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
children: [
 Text('Good Morning',
 style:Styles.headLinestyle3,),
const SizedBox(height: 5), // Adds a vertical space of 10 pixels

   Text('Book Tickets',
   style: Styles.headLinestyle1,),
],
                  ),
                Container(
  height:50,
  width: 50,
 decoration:BoxDecoration(
     borderRadius: BorderRadius.circular(10),
    image:const DecorationImage(
     fit:BoxFit.fitHeight,
     image:AssetImage(
        "lib/images/img_1.png"
       )
      )
   ),
 )
                  ],
                  ),
             const  SizedBox(height:25),
              Container(
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color:const Color(0xFFF4F6FD)
                ) ,
                padding:const EdgeInsets.symmetric(horizontal:12, vertical: 12),
                child: Row(
                  children:[
                    const Icon(FluentSystemIcons.ic_fluent_search_regular,color:Color(0xFFBFC205)),
                    Text(
                      "Search",
                      style:Styles.headLinestyle4,
                    )
                  ]
                ),
              )
              ,
             const  SizedBox(height: 40,),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming Flights",style:Styles.headLinestyle2
                  ),
                  InkWell(
                    onTap: () {
                      print("you are tapped");
                    },
                    child: Text("View all", style:Styles.textstyle.copyWith(color:Styles.primaryColor),)),
                ],
              ),
              
              ],
            ),
         )
       ,
        const SizedBox(height:15),
    SingleChildScrollView( //flight haru herna container blue orange
       scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left:20),
        child:Row(
          children: ticketList.map((singleTicket)=> TicketView(ticket: singleTicket,)).toList(),
       
        ),
      )  ,
     const  SizedBox(height:15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal:20),
          child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hotels",style:Styles.headLinestyle2
                    ),
                    InkWell(
                      onTap: () {
                        print("you are tapped");
                      },
                      child: Text("View all", style:Styles.textstyle.copyWith(color:Styles.primaryColor),)),
                  ],
                ),
        ),
  const  SizedBox(height:15),
 SingleChildScrollView(
            scrollDirection: Axis.horizontal,
        padding:const EdgeInsets.only(left:20),
    child:Row(
          children:hotelList.map((singleHotel) => HotelScreen(hotel:singleHotel)).toList(),
        ),
        
     )
     ],
      ),
    );
   }
}
