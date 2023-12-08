// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:yatra1/components/calendarpopupview.dart';
// // import 'package:yatra1/applocalization.dart';
// import 'package:yatra1/hoteldetail/popularlistview.dart';
// import 'package:yatra1/hoteldetail/titleview.dart';
// import 'package:yatra1/providers/theme_provider.dart';
// import 'package:yatra1/widgets/commonsearchbar.dart';
// import 'package:yatra1/utilis/hotel_theme.dart';
// import 'package:yatra1/utilis/hotellistmodel.dart';
// import 'package:yatra1/screens/hotellistview.dart';
// // import 'package:yatra1/utils/enum.dart';
// // import 'package:yatra1/utils/text_styles.dart';
// // import 'package:yatra1/utils/themes.dart';
// // import 'package:yatra1/widgets/bottomtopmoveanimation.dart';
// // import 'package:yatra1/widgets/commonbutton.dart';
// // import 'package:yatra1/widgets/commoncard.dart';
// // import 'package:yatra1/screens/homescreen.dart';

// class HotelHomeScreen extends StatefulWidget {
//   const HotelHomeScreen({super.key});

//   @override
//   State<HotelHomeScreen> createState() => _HotelHomeScreenState();
// }

// class _HotelHomeScreenState extends State<HotelHomeScreen>
// with TickerProviderStateMixin {

// late AnimationController animationController;
// late AnimationController _animationController;
// DateTime startDate =DateTime.now();
// DateTime endDate = DateTime.now().add(const Duration(days: 5));

// List<HotelListData> hotelList = HotelListData.hotelList;

// @override
// void initState(){
//   super.initState();
//   animationController = AnimationController(
//   duration: const Duration(milliseconds: 1000),
//     vsync: this
//   );
// }

// @override
// void dispose(){
//   super.dispose();
//   animationController?.dispose();
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
// getAppBarUI(context),
// Expanded(child: NestedScrollView(
//   headerSliverBuilder: (context, innerBoxIsScrolled) {
//   return <Widget>[
// SliverList(delegate: SliverChildBuilderDelegate((context, index) {
// return Column(
// children:<Widget> [
// // getAppBarUI(),
// getTimeDateUI(context, DateTime.now(), DateTime.now().add(const Duration(days: 5))),

// ],
// );
// },
// childCount: 1
// )),
// SliverPersistentHeader(delegate:ContestTabHeader(getFilterBarUI()))
//   ];
// },
// body:Container(
//   color:HotelTheme.buildLightTheme().backgroundColor,
//   child:ListView.builder(
//   itemBuilder: (context, index) {
//     final int count=hotelList.length > 10 ? 10 :hotelList.length;
//     final Animation<double> animation = Tween<double>(
//       begin:0.0,
//       end:1.0
//     ).animate(CurvedAnimation(parent: animationController!, curve: Interval(
//       (1/count) * index,1.0,curve:Curves.fastOutSlowIn
//     )));
//     animationController!.forward();
//     return HotelListView(
//     callback: () {},
//     hotelData: hotelList[index],
//     animation: animation,
//     animationController: animationController,
//   );
//   } ,
//   itemCount: hotelList.length,
//   padding: const EdgeInsets.only(top: 8),
//   scrollDirection: Axis.vertical,
// ),

// ),
// ))
//         ],
//       )
//     );
//   }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart' as Cupertino;
import 'package:yatra1/components/roompopupview.dart';
import 'package:yatra1/hoteldetail/roombookingscreen.dart';
import 'package:yatra1/hoteldetail/roombookview.dart';
// import 'package:yatra1/components/calendarpopupview.dart';
import 'package:yatra1/utilis/hotel_theme.dart';
import 'package:yatra1/utilis/roomdata.dart';
import 'package:yatra1/utils/themes.dart';
import 'package:yatra1/utils/text_styles.dart';
import 'package:yatra1/widgets/commonbutton.dart';
import 'package:yatra1/screens/hotellistview.dart';
// import 'package:yatra1/utilis/hotellistdata.dart';
import 'package:yatra1/utilis/hotellistmodel.dart';
import 'package:yatra1/hoteldetail/filterscreen/filterscreen.dart';
 import 'package:table_calendar/table_calendar.dart';

class HotelHomeScreen extends StatefulWidget {
  const HotelHomeScreen({Key? key}) : super(key: key);

  @override
  _HotelHomeScreenState createState() => _HotelHomeScreenState();
}

// class _HotelHomeScreenState extends State<HotelHomeScreen>
//     with TickerProviderStateMixin {
//   late AnimationController animationController;
//   late AnimationController _animationController;
//  var hotelList = HotelListData.hotelList;
// ScrollController scrollController =new ScrollController();

// int room =1;
// int add=2;

//   DateTime startDate = DateTime.now();
//   DateTime endDate = DateTime.now().add(const Duration(days: 5));

// //  List<HotelListData> hotelList = HotelListData.hotelList;
// // List<HotelListData> hotelList = HotelListData.hotelList.whereType<HotelListData>().toList();
// // List<HotelListData> hotelList = HotelListData.hotelList.whereType<HotelListData>().toList();
// // List<HotelListData> hotelList = HotelListData.hotelList;

//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     animationController?.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           getAppBarUI(context),
//           Expanded(
//             child: NestedScrollView(
//               headerSliverBuilder: (context, innerBoxIsScrolled) {
//                 return <Widget>[
//                   SliverList(
//                     delegate: SliverChildBuilderDelegate((context, index) {
//                       return Column(
//                         children: <Widget>[
//                           getTimeDateUI(context, startDate, endDate),
//                         ],
//                       );
//                     }, childCount: 1),
//                   ),
//                   SliverPersistentHeader(delegate: ContestTabHeader(getFilterBarUI())),
//                 ];
//               },
//               body: Container(
//                 color: HotelTheme.buildLightTheme().backgroundColor,
//                 child: ListView.builder(
//                   itemBuilder: (context, index) {
//                     final int count = hotelList.length > 10 ? 10 : hotelList.length;
//                     final Animation<double> animation = Tween<double>(
//                       begin: 0.0,
//                       end: 1.0,
//                     ).animate(CurvedAnimation(
//                         parent: animationController!,
//                         curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn)));
//                     animationController!.forward();
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => RoomeBookView(
//                               roomData: hotelList[index].roomData,
//                               animationController: animationController,
//                               animation: animation,
//                             ),
//                           ),
//                         );
//                       },
//                       child: HotelListView(
//                         callback: () {},
//                         hotelData: hotelList[index],
//                         animation: animation,
//                         animationController: animationController,
//                       ),
//                     );
//                   },
//                   itemCount: hotelList.length,
//                   padding: const EdgeInsets.only(top: 8),
//                   scrollDirection: Axis.vertical,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

class _HotelHomeScreenState extends State<HotelHomeScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  var hotelList = HotelListData.hotelList;
  ScrollController scrollController = ScrollController();

  int room = 1;
  int add = 2;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          getAppBarUI(context),
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Column(
                        children: <Widget>[
                          getTimeDateUI(context, startDate, endDate),
                        ],
                      );
                    }, childCount: 1),
                  ),
                  SliverPersistentHeader(delegate: ContestTabHeader(getFilterBarUI())),
                ];
              },
              body: Container(
                color: HotelTheme.buildLightTheme().backgroundColor,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final int count = hotelList.length > 10 ? 10 : hotelList.length;
                    final Animation<double> animation = Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).animate(CurvedAnimation(
                      parent: animationController,
                      curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
                    ));
                    animationController.forward();
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => RoomeBookView(
                            //   roomData: hotelList[index].roomData,
                            //   animationController: animationController,
                            //   animation: animation,
                            // ),
                            builder:(context) => RoomBookingScreen(hotelList[index].titleTxt),
                          ),
                        );
                      },
                      child: HotelListView(
                        callback: () {},
                        hotelData: hotelList[index],
                        animation: animation,
                        animationController: animationController,
                      ),
                    );
                  },
                  itemCount: hotelList.length,
                  padding: const EdgeInsets.only(top: 8),
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

 Widget getFilterBarUI() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              color: HotelTheme.buildLightTheme().backgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8.0,
                )
              ],
            ),
          ),
        ),
        Container(
          color: HotelTheme.buildLightTheme().backgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '530 hotels found',
                      style: TextStyle(
                        color:Colors.black,
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // Navigate to the filter screen when the filter icon is clicked
                     Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => FiltersScreen()),
);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.sort,
                              color: Colors.black, // Set the dark color here
                              size: 24, // Set the icon size here
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

  getSearchbarUI(){
    return Padding(padding: EdgeInsets.only(bottom:8,top:8,right:16,left:16),
    child:Row(
      children: <Widget>[
        Expanded(child: Padding(
          padding: const EdgeInsets.only(right:16,top:8,bottom:8),
          child:Container(
            decoration: BoxDecoration(
              color:HotelTheme.buildLightTheme().backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(38)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color:Colors.grey.withOpacity(0.2),
                  offset:const Offset(0,2),
                  blurRadius: 8
                )
              ]
              
            ),
            child:Padding(
                padding: const EdgeInsets.only(left:16,right:16,top:4,bottom:4,),
                child:TextField(
                  style:const TextStyle(
                    fontSize: 18,
                  ),
                  cursorColor: HotelTheme.buildLightTheme().primaryColor,
                  decoration: InputDecoration(
                    border:InputBorder.none,
                    hintText: 'Attariya'
                  ),
                )
                ),
          ),
          )),
          Container(
            decoration: BoxDecoration(
color:HotelTheme.buildLightTheme().primaryColor,
borderRadius: BorderRadius.all(Radius.circular(38)),
boxShadow: <BoxShadow>[
  BoxShadow(
    color:Colors.grey.withOpacity(0.4),
    offset:const Offset(0, 2),
    blurRadius: 8,
  )
]
            ),
            child:Material(
color:Colors.transparent,
child: InkWell(
  borderRadius: BorderRadius.all(Radius.circular(38)),
  onTap: (){

  },
  child: Padding(
    padding: const EdgeInsets.all(10),
    child: Icon( Icons.search  ,
    size:26,
    color:HotelTheme.buildLightTheme().backgroundColor,

    ),
  ),
),
            ),
          )
      ],
    ),
    );
  }
//   getTimeDateUI(){
// return  Padding(
//   padding: const EdgeInsets.only(left:18,bottom:16),
//   child:Row(
//     children: <Widget>[
//       Expanded(child: Row(
//         children: <Widget>[
//           Material(color:Colors.transparent,
//           child:Padding(
//             padding: const EdgeInsets.symmetric(vertical:4,horizontal:8 ),
//             child:Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment:MainAxisAlignment.center ,
// children:<Widget>[
//   Text(
//     "Choose Date",
//     style:TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w100,
//       color:Colors.grey.withOpacity(0.8)
//     )
//   ),
//   const SizedBox(height:8),
//   Text(
//     "${DateFormat('dd,MMM').format(startDate)}-${DateFormat('dd,MMM').format(endDate)}",
//     style:TextStyle(
//       fontSize: 10,
//       fontWeight: FontWeight.w100,
//       color:Colors.grey.withOpacity(0.8)
//     )
//   ),
// ]
//                   ))
//             )
//         ],
//       )),
//       Padding(
//         padding: const EdgeInsets.only(right:8),
//         child:Container(
//           width:1,
//           height:42,
//           color:Colors.grey.withOpacity(0.8),
//         ),
//         ),
//         Expanded(child: Row(
//           children: <Widget>[
//              Material(
//             color:Colors.transparent,
//             child:Padding(
//               padding: const EdgeInsets.symmetric(vertical:4,horizontal: 8 ),
//               child:Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:<Widget> [
// Text(
//   "Number of Rooms",
//   style:TextStyle(
//     fontWeight: FontWeight.w100,
//     fontSize: 10,
//     color:Colors.grey.withOpacity(0.8)
//   ),
// ),
// const SizedBox(height:8),
// const Text(
//   "1 Room - 2 Adults",
//   style:TextStyle(
//     fontWeight: FontWeight.w100,
//     fontSize: 10,
//   ),
// ),
//                 ],
//               )
//               ),
//           )
//           ],
         
//         ))
//     ],
//   )
//   );
// //   }
//  Widget getTimeDateUI() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 18, bottom: 16),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   "Choose Date",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w100,
//                     color: Colors.grey.withOpacity(0.8),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "${DateFormat('dd,MMM').format(startDate)}-${DateFormat('dd,MMM').format(endDate)}",
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w100,
//                     color: Colors.grey.withOpacity(0.8),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 8), // Add spacing between columns
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   "Number of Rooms",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w100,
//                     fontSize: 12,
//                     color: Colors.grey.withOpacity(0.8),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "1 Room - 2 Adults",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w100,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
 

//  Widget getTimeDateUI(BuildContext context,DateTime startDate,DateTime endDate) {
//     initialStartDate: DateTime.now();
//     return Padding(
//       padding: const EdgeInsets.only(left: 18, bottom: 16),
//       child: InkWell(
//         onTap: () {
//           // Navigate to the CalendarPopupView page
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CalendarPopupView(initialStartDate: DateTime.now(), 
//               initialEndDate:DateTime.now() , onApplyClick: (DateTime startDate, DateTime endDate) {  },

//                minimumDate: null, maximumDate: null, onCancelClick: null,),
//             ),
//           );
//         },
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Choose Date",
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w100,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     "${DateFormat('dd,MMM').format(startDate)}-${DateFormat('dd,MMM').format(endDate)}",
//                     style:const  TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w100,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 8), // Add spacing between columns
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Number of Rooms",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w100,
//                       fontSize: 12,
//                       color: Colors.grey.withOpacity(0.8),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     "1 Room - 2 Adults",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w100,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//  Widget getTimeDateUI(BuildContext context, DateTime startDate, DateTime endDate) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 18, bottom: 16),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   "Choose Date",
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w100,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 InkWell(
//                   onTap: () {
//                     // Show date picker when "Choose Date" is tapped
//                     _selectDate(context);
//                   },
//                   child: Text(
//                     "${DateFormat('dd,MMM').format(startDate)}-${DateFormat('dd,MMM').format(endDate)}",
//                     style: const TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w100,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 8), // Add spacing between columns
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   "Number of Rooms",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w100,
//                     fontSize: 12,
//                     color: Colors.grey.withOpacity(0.8),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "1 Room - 2 Adults",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w100,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// Widget getTimeDateUI(BuildContext context, DateTime startDate, DateTime endDate) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 18, bottom: 16),
//     child: Row(
//       children: <Widget>[
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 "Choose Date",
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w100,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               GestureDetector(
//                 onTap: () {
//                   // Show date picker when "Choose Date" is tapped
//                   _selectDate(context);
//                 },
//                 child: Text(
//                   "${DateFormat('dd,MMM').format(startDate)} - ${DateFormat('dd,MMM').format(endDate)}",
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w100,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 8),
//      const   Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 "Number of Rooms",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w100,
//                   fontSize: 12,
//                   color: Colors.black,
//                 ),
//               ),
//                SizedBox(height: 8),
//               const Text(
//                 "1 Room - 2 Adults",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w100,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

Widget getTimeDateUI(BuildContext context, DateTime startDate, DateTime endDate) {
  return Padding(
    padding: const EdgeInsets.only(left: 18, bottom: 16),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Choose Date",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  // Show date picker when "Choose Date" is tapped
                  _selectDate(context);
                },
                child: Text(
                  "${DateFormat('dd,MMM').format(startDate)} - ${DateFormat('dd,MMM').format(endDate)}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Navigate to RoomPopupView page when "Number of Rooms" is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoomPopupView(
                  barrierDismissible: true,
                 roomData: RoomData(numberRoom: 1, people: 2),
 
                   onChnage: (RoomData ) {  },)),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Number of Rooms",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "1 Room - 2 Adults",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


Future<void> _selectDate(BuildContext context) async {
  DateTimeRange? picked = await showCupertinoModalPopup<DateTimeRange>(
    context: context,
    builder: (BuildContext context) {
      DateTime currentDate = DateTime.now();
      var startDate;
      return Container(
        height: 200,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: startDate,
          minimumDate: currentDate,
          maximumDate: DateTime(2101),
          onDateTimeChanged: (DateTime newDate) {
            // Do nothing, we only want the range
          },
        ),
      );
    },
  );

  if (picked != null) {
    setState(() {
      var startDate = picked.start;
      var endDate = picked.end!;
    });
  }
}


  
  void setState(Null Function() param0) {
  }


  Widget getAppBarUI(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: HotelTheme.buildLightTheme().colorScheme.background,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          offset: const Offset(0, 2),
          blurRadius: 8.0,
        ),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 8,
        right: 8,
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
          width: AppBar().preferredSize.height! + 40,
height: AppBar().preferredSize.height!,

            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(32)),
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Your Title Here",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            width: AppBar().preferredSize.height + 40,
            height: AppBar().preferredSize.height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32),
                    ),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.favorite_border),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32),
                    ),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.location_on_rounded),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}



class ContestTabHeader extends SliverPersistentHeaderDelegate{

final Widget searchUI;
ContestTabHeader(this.searchUI);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
double get maxExtent => 52.0;

  @override

  double get minExtent => 52.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
   return false;
  }
}



// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:yatra1/providers/theme_provider.dart';
// import 'package:yatra1/utilis/hotel_theme.dart';
// import 'package:yatra1/utilis/hotellistmodel.dart';
// import 'package:yatra1/screens/hotellistview.dart';
// import 'package:yatra1/utils/enum.dart';

// class HotelHomeScreen extends StatefulWidget {
//   const HotelHomeScreen({super.key});

//   @override
//   State<HotelHomeScreen> createState() => _HotelHomeScreenState();
// }

// class _HotelHomeScreenState extends State<HotelHomeScreen>
// with TickerProviderStateMixin {

// late AnimationController animationController;
// late AnimationController _animationController;
// var hotelList = HotelListData.hotelList;
// ScrollController scrollController = new ScrollController();

// int room = 1;
// int add=2;

// DateTime startDate =DateTime.now();
// DateTime endDate = DateTime.now().add(const Duration(days: 5));

// bool _isShowMap=false;

// final searchBarHeight = 158.0;
// final filterbarHeight = 52.0;

// @override
// void initState(){

//  animationController = AnimationController(duration:Duration(milliseconds: 1000),vsync: this);
//    _animationController = AnimationController(duration:Duration(milliseconds: 0),vsync: this);

//    scrollController
//    ..addListener(() {
//     if(scrollController.offset <=0){
// //we static set the just below half scrolling values
// _animationController.animateTo(0.0);
//     }else if(scrollController.offset > 0.0 && scrollController.offset< searchBarHeight){
//       //we need aroung half scrolling values
//       _animationController.animateTo((scrollController.offset/searchBarHeight));
//     }else{
//       _animationController.animateTo(0.0);
//     }
//    });
// }

// // List<HotelListData> hotelList = HotelListData.hotelList;
// // AnimationController? animationController;

// // @override
// // void initState(){
// //   super.initState();
// //   animationController = AnimationController(
// //   duration: const Duration(milliseconds: 1000),
// //     vsync: this
// //   );
// // }
// Future<bool> getData() async{
//   await Future.delayed(Duration(milliseconds: 200));
// }
// @override
// void dispose(){
//   animationController.dispose();
//   super.dispose();
// }

// // @override
// // void dispose(){
// //   super.dispose();
// //   animationController?.dispose();
// // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// //       body:Column(
// //         crossAxisAlignment: CrossAxisAlignment.stretch,
// //         children: <Widget>[
// // getAppBarUI(),
// // Expanded(child: NestedScrollView(
// //   headerSliverBuilder: (context, innerBoxIsScrolled) {
// //   return <Widget>[
// // SliverList(delegate: SliverChildBuilderDelegate((context, index) {
// // return Column(
// // children:<Widget> [
// // // getAppBarUI(),
// // getTimeDateUI(),
// // ],
// // );
// // },
// // childCount: 1
// // )),
// // SliverPersistentHeader(delegate:ContestTabHeader(getFilterBarUI()))
// //   ];
// // },
// // body:Container(
// //   color:HotelTheme.buildLightTheme().backgroundColor,
// //   child:ListView.builder(
// //   itemBuilder: (context, index) {
// //     final int count=hotelList.length > 10 ? 10 :hotelList.length;
// //     final Animation<double> animation = Tween<double>(
// //       begin:0.0,
// //       end:1.0
// //     ).animate(CurvedAnimation(parent: animationController!, curve: Interval(
// //       (1/count) * index,1.0,curve:Curves.fastOutSlowIn
// //     )));
// //     animationController!.forward();
// //     return HotelListView(
// //     callback: () {},
// //     hotelData: hotelList[index],
// //     animation: animation,
// //     animationController: animationController,
// //   );
// //   } ,
// //   itemCount: hotelList.length,
// //   padding: const EdgeInsets.only(top: 8),
// //   scrollDirection: Axis.vertical,
// // ),

// // ),
// // ))
// //         ],
// //       )
// body:Stack(
//   children: [
//     RemoveFocuse(
//       onClick:(){
//         FocusScope.of(context).requestFocus(FocusNode());
//       },
//       child:Column(
//         children: [
// _getAppBarUI(),
// Expanded(child: Stack(
//   children: [
//     Container(
//   color:HotelTheme.buildLightTheme().backgroundColor,
//    child:ListView.builder(
//   //  itemBuilder: (context, index) {
//   //    final int count=hotelList.length > 10 ? 10 :hotelList.length;
//   //    final Animation<double> animation = Tween<double>(
//   //      begin:0.0,
//   //      end:1.0
//   //   ).animate(CurvedAnimation(parent: animationController!, curve: Interval(
//   //      (1/count) * index,1.0,curve:Curves.fastOutSlowIn
//   //    )));
//   //    animationController!.forward();
//   //    return HotelListView(
//   //    callback: () {},
//   //    hotelData: hotelList[index],
//   //    animation: animation,
//   //    animationController: animationController,
//   //  );
//   //  } ,
//   controller: scrollController,
//    itemCount: hotelList.length,
//    padding: const EdgeInsets.only(top: 8+158+52),
//    scrollDirection: Axis.vertical,
//     itemBuilder: (context, index) {
// var count=hotelList.length > 10 ? 10 :hotelList.length;
//  var animation = Tween(
//         begin:0.0,
//       end:1.0
//     ).animate(CurvedAnimation(parent: animationController!, curve: Interval(
//       (1/count) * index,1.0,curve:Curves.fastOutSlowIn
//    )));
// animationController.forward();
// return SizedBox(height:10);
//     }
//  ),

//  ),
//  AnimatedBuilder(
//   animation: _animationController,
//    builder: (BuildContext context,Widget? child){
//     return Positioned(
//      top: -searchBarHeight*(_animationController.value),
//     left:0,
//     right:0,
//     child:Column(
//      children: [
//       Container(
//              decoration: BoxDecoration(
//                color:HotelTheme.buildLightTheme().backgroundColor,
//                borderRadius: const BorderRadius.all(Radius.circular(38)),
// //               boxShadow: <BoxShadow>[
// //                 BoxShadow(
// //                   color:Colors.grey.withOpacity(0.2),
// //                   offset:const Offset(0,2),
// //                   blurRadius: 8
// //                 )
// //               ]
              
// //             ),
//      ],
//     )
//  );
//    }
//    )
//  ),
//  ),
//          ],
//        ),
//    )
// //   }
//   ],
// ),
// );
//   }
   
// getFilterBarUI(){
//   return Stack(
// children:<Widget>[
//   Positioned(
//     top:0,
//     left:0,
//     right:0,
//     child: Container(
//       height:24,
//      decoration: BoxDecoration(
//     color:HotelTheme.buildLightTheme().backgroundColor,
// boxShadow: [
//   BoxShadow(
//     offset:Offset(0,2),
//     color:Colors.grey.withOpacity(0.2),
//    blurRadius: 8.0,)
//    ]), 
//     )),
//     Container(
//       color:HotelTheme.buildLightTheme().backgroundColor,
//       child:Padding(
//         padding:const EdgeInsets.only(left:16,right:16,top:8,bottom:4),
//         child:Row(
//           children:<Widget>[
//             Expanded(child:Padding(
//               padding:const EdgeInsets.all(8),
//               child:Text('530 hotel found',style:TextStyle(
//                 fontWeight:FontWeight.w100,
//                 fontSize:16,
//               ),),
//             )),
//             Material(
//               color:Colors.transparent,
//               child:Padding(padding:const EdgeInsets.only(left:8),
//               child:Row(
//                 children:<Widget>[
//                 Text('Filter',style:TextStyle(
//                 fontWeight:FontWeight.w100,
//                 fontSize:16,
//               ),),
//               Padding(padding:const EdgeInsets.all(8.0),
//               child:Icon(Icons.sort,color:HotelTheme.buildLightTheme().primaryColor),
              
//               )
//                 ],
//               )
//               )
//             )
//           ]
//         )
//       )
//     )
// ]
//   );
// }


//   getSearchbarUI(){
//     return Padding(padding: EdgeInsets.only(bottom:8,top:8,right:16,left:16),
//     child:Row(
//       children: <Widget>[
//         Expanded(child: Padding(
//           padding: const EdgeInsets.only(right:16,top:8,bottom:8),
//           child:Container(
//             decoration: BoxDecoration(
//               color:HotelTheme.buildLightTheme().backgroundColor,
//               borderRadius: const BorderRadius.all(Radius.circular(38)),
//               boxShadow: <BoxShadow>[
//                 BoxShadow(
//                   color:Colors.grey.withOpacity(0.2),
//                   offset:const Offset(0,2),
//                   blurRadius: 8
//                 )
//               ]
              
//             ),
//             child:Padding(
//                 padding: const EdgeInsets.only(left:16,right:16,top:4,bottom:4,),
//                 child:TextField(
//                   style:const TextStyle(
//                     fontSize: 18,
//                   ),
//                   cursorColor: HotelTheme.buildLightTheme().primaryColor,
//                   decoration: InputDecoration(
//                     border:InputBorder.none,
//                     hintText: 'Attariya'
//                   ),
//                 )
//                 ),
//           ),
//           )),
//           Container(
//             decoration: BoxDecoration(
// color:HotelTheme.buildLightTheme().primaryColor,
// borderRadius: BorderRadius.all(Radius.circular(38)),
// boxShadow: <BoxShadow>[
//   BoxShadow(
//     color:Colors.grey.withOpacity(0.4),
//     offset:const Offset(0, 2),
//     blurRadius: 8,
//   )
// ]
//             ),
//             child:Material(
// color:Colors.transparent,
// child: InkWell(
//   borderRadius: BorderRadius.all(Radius.circular(38)),
//   onTap: (){

//   },
//   child: Padding(
//     padding: const EdgeInsets.all(10),
//     child: Icon( Icons.search  ,
//     size:26,
//     color:HotelTheme.buildLightTheme().backgroundColor,

//     ),
//   ),
// ),
//             ),
//           )
//       ],
//     ),
//     );
//   }
//   getTimeDateUI(){
// return  Padding(
//   padding: const EdgeInsets.only(left:18,bottom:16),
//   child:Row(
//     children: <Widget>[
//       Expanded(child: Row(
//         children: <Widget>[
//           Material(color:Colors.transparent,
//           child:Padding(
//             padding: const EdgeInsets.symmetric(vertical:4,horizontal:8 ),
//             child:Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment:MainAxisAlignment.center ,
// children:<Widget>[
//   Text(
//     "Choose Date",
//     style:TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w100,
//       color:Colors.grey.withOpacity(0.8)
//     )
//   ),
//   const SizedBox(height:8),
//   Text(
//     "${DateFormat('dd,MMM').format(startDate)}-${DateFormat('dd,MMM').format(endDate)}",
//     style:TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w100,
//       color:Colors.grey.withOpacity(0.8)
//     )
//   ),
// ]
//                   ))
//             )
//         ],
//       )),
//       Padding(
//         padding: const EdgeInsets.only(right:8),
//         child:Container(
//           width:1,
//           height:42,
//           color:Colors.grey.withOpacity(0.8),
//         ),
//         ),
//         Expanded(child: Row(
//           children: <Widget>[
//              Material(
//             color:Colors.transparent,
//             child:Padding(
//               padding: const EdgeInsets.symmetric(vertical:4,horizontal: 8 ),
//               child:Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:<Widget> [
// Text(
//   "Number of Rooms",
//   style:TextStyle(
//     fontWeight: FontWeight.w100,
//     fontSize: 16,
//     color:Colors.grey.withOpacity(0.8)
//   ),
// ),
// const SizedBox(height:8),
// const Text(
//   "1 Room - 2 Adults",
//   style:TextStyle(
//     fontWeight: FontWeight.w100,
//     fontSize: 16,
//   ),
// ),
//                 ],
//               )
//               ),
//           )
//           ],
         
//         ))
//     ],
//   )
//   );
//   }

  
//   Widget _getAppBarUI() {
//   // return Container(
//   //   decoration: BoxDecoration(
//   //     color: HotelTheme.buildLightTheme().colorScheme.background,
//   //     boxShadow: [
//   //       BoxShadow(
//   //         color: Colors.grey.withOpacity(0.2),
//   //         offset: const Offset(0, 2),
//   //         blurRadius: 8.0,
//   //       ),
//   //     ],
//   //   ),
//   //   child: Padding(
//      return padding: EdgeInsets.only(
//         top: MediaQuery.of(context).padding.top,
//         left: 8,
//         right: 8,
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Container(
//             alignment: context.read<ThemeProvider>().languageType == LanguageType.ar
//             ?Alignment.centerRight:
//             Alignment.centerLeft,
//           width: AppBar().preferredSize.height! + 40,
// height: AppBar().preferredSize.height!,

//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 borderRadius: const BorderRadius.all(Radius.circular(32)),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Padding(
//                   padding: EdgeInsets.all(8),
//                   child: Icon(Icons.arrow_back),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child: Text(
//               AppLocalizations(context).of"explore",
//                 style: TextStyle(context).getTextStyle(),
//               ),
//             ),
//           ),
//           Container(
//             width: AppBar().preferredSize.height + 40,
//             height: AppBar().preferredSize.height,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(32),
//                     ),
//                     onTap: () {},
//                     child: const Padding(
//                       padding: EdgeInsets.all(8),
//                       child: Icon(Icons.favorite_border),
//                     ),
//                   ),
//                 ),
//                 Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(32),
//                     ),
//                     onTap: () {},
//                     child: const Padding(
//                       padding: EdgeInsets.all(8),
//                       child: Icon(Icons.location_on_rounded),
//                     ),
//                   ),
//                 ),
//                  Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(32),
//                     ),
//                     onTap: () {
//                      setState(() {
//                        _isShowMap = !_isShowMap;
//                      }); 
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.all(8),
//                       child: Icon(
// _isShowMap? Icons.sort:FontAwesomeIcons.mapMarkedAt),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// }

// class ContestTabHeader extends SliverPersistentHeaderDelegate{

// final Widget searchUI;
// ContestTabHeader(this.searchUI);

//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return searchUI;
//   }

//   @override
// double get maxExtent => 52.0;

//   @override

//   double get minExtent => 52.0;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//    return false;
//   }
// }


// class HomeExploreScreen extends StatefulWidget {
//   final AnimationController animationController;
//   const HomeExploreScreen({Key? key, required this.animationController})
//       : super(key: key);
//   @override
//   _HomeExploreScreenState createState() => _HomeExploreScreenState();
// }
// class _HomeExploreScreenState extends State<HomeExploreScreen>
//     with TickerProviderStateMixin {
//   var hotelList = HotelListData.hotelList;
//   late ScrollController controller;
//   late AnimationController _animationController;
//   var sliderImageHieght = 0.0;
//   @override
//   void initState() {
//     _animationController =
//         AnimationController(duration: Duration(milliseconds: 0), vsync: this);
//     widget.animationController.forward();
//     controller = ScrollController(initialScrollOffset: 0.0);
//     controller
//       ..addListener(() {
//         if (mounted) {
//           if (controller.offset < 0) {
//             // we static set the just below half scrolling values
//             _animationController.animateTo(0.0);
//           } else if (controller.offset > 0.0 &&
//               controller.offset < sliderImageHieght) {
//             // we need around half scrolling values
//             if (controller.offset < ((sliderImageHieght / 1.5))) {
//               _animationController
//                   .animateTo((controller.offset / sliderImageHieght));
//             } else {
//               // we static set the just above half scrolling values "around == 0.64"
//               _animationController
//                   .animateTo((sliderImageHieght / 1.5) / sliderImageHieght);
//             }
//           }
//         }
//       });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     sliderImageHieght = MediaQuery.of(context).size.width * 1.3;
//     return BottomTopMoveAnimationView(
//       animationController: widget.animationController,
//       child: Consumer<ThemeProvider>(
//         builder: (context, provider, child) => Stack(
//           children: <Widget>[
//             Container(
//               color: AppTheme.scaffoldBackgroundColor,
//               child: ListView.builder(
//                 controller: controller,
//                 itemCount: 4,
//                 // padding on top is only for we need spec for sider
//                 padding:
//                     EdgeInsets.only(top: sliderImageHieght + 32, bottom: 16),
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: (context, index) {
//                   // some list UI
//                   var count = 4;
//                   var animation = Tween(begin: 0.0, end: 1.0).animate(
//                     CurvedAnimation(
//                       parent: widget.animationController,
//                       curve: Interval((1 / count) * index, 1.0,
//                           curve: Curves.fastOutSlowIn),
//                     ),
//                   );
//                   if (index == 0) {
//                     return TitleView(
//                       titleTxt:
//                           AppLocalizations(context).of("popular_destination"),
//                       subTxt: '',
//                       animation: animation,
//                       animationController: widget.animationController,
//                       click: () {},
//                     );
//                   } else if (index == 1) {
//                     return Padding(
//                       padding: const EdgeInsets.only(top: 8),
//                       //Popular Destinations animation view
//                       child: PopularListView(
//                         animationController: widget.animationController,
//                         callBack: (index) {},
//                       ),
//                     );
//                   } else if (index == 2) {
//                     return TitleView(
//                       titleTxt: AppLocalizations(context).of("best_deal"),
//                       subTxt: AppLocalizations(context).of("view_all"),
//                       animation: animation,
//                       isLeftButton: true,
//                       animationController: widget.animationController,
//                       click: () {},
//                     );
//                   } else {
//                     return getDealListView(index);
//                   }
//                 },
//               ),
//             ),
//             // sliderUI with 3 images are moving
//             _sliderUI(),
//             // viewHotels Button UI for click event
//             _viewHotelsButton(_animationController),
//             //just gradient for see the time and battry Icon on "TopBar"
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: 80,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                   colors: [
//                     Theme.of(context).backgroundColor.withOpacity(0.4),
//                     Theme.of(context).backgroundColor.withOpacity(0.0),
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 )),
//               ),
//             ),
//             //   serachUI on Top  Positioned
//             Positioned(
//               top: MediaQuery.of(context).padding.top,
//               left: 0,
//               right: 0,
//               child: serachUI(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _viewHotelsButton(AnimationController _animationController) {
//     return AnimatedBuilder(
//       animation: _animationController,
//       builder: (BuildContext context, Widget? child) {
//         var opecity = 1.0 -
//             (_animationController.value > 0.64
//                 ? 1.0
//                 : _animationController.value);
//         return Positioned(
//           left: 0,
//           right: 0,
//           top: 0,
//           height: sliderImageHieght * (1.0 - _animationController.value),
//           child: Stack(
//             children: <Widget>[
//               Positioned(
//                 bottom: 32,
//                 left: context.read<ThemeProvider>().languageType ==
//                         LanguageType.ar
//                     ? null
//                     : 24,
//                 right: context.read<ThemeProvider>().languageType ==
//                         LanguageType.ar
//                     ? 24
//                     : null,
//                 child: Opacity(
//                   opacity: opecity,
//                   child: CommonButton(
//                     onTap: () {
//                       if (opecity != 0) {
//                         NavigationServices(context).gotoHomeScreen();
//                       }
//                     },
//                     buttonTextWidget: Padding(
//                       padding: const EdgeInsets.only(
//                           left: 24, right: 24, top: 8, bottom: 8),
//                       child: Text(
//                         AppLocalizations(context).of("view_hotel"),
//                         style: TextStyles(context)
//                             .getRegularStyle()
//                             .copyWith(color: AppTheme.whiteColor),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//   Widget _sliderUI() {
//     return Positioned(
//       top: 0,
//       left: 0,
//       right: 0,
//       child: AnimatedBuilder(
//         animation: _animationController,
//         builder: (BuildContext context, Widget? child) {
//           // we calculate the opecity between 0.64 to 1.0
//           var opecity = 1.0 -
//               (_animationController.value > 0.64
//                   ? 1.0
//                   : _animationController.value);
//           return SizedBox(
//             height: sliderImageHieght * (1.0 - _animationController.value),
//             child: HomeExploreSliderView(
//               opValue: opecity,
//               click: () {},
//             ),
//           );
//         },
//       ),
//     );
//   }
//   Widget getDealListView(int index) {
//     var hotelList = HotelListData.hotelList;
//     List<Widget> list = [];
//     hotelList.forEach((f) {
//       var animation = Tween(begin: 0.0, end: 1.0).animate(
//         CurvedAnimation(
//           parent: widget.animationController,
//           curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn),
//         ),
//       );
//       list.add(
//         HotelListViewPage(
//           callback: () {
//             Scaffold();
//             NavigationServices(context).gotoHotelDetailes(f);
//           },
//           hotelData: f,
//           animation: animation,
//           animationController: widget.animationController,
//         ),
//       );
//     });
//     return Padding(
//       padding: const EdgeInsets.only(top: 8),
//       child: Column(
//         children: list,
//       ),
//     );
//   }
//   Widget serachUI() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
//       child: CommonCard(
//         radius: 36,
//         child: InkWell(
//           borderRadius: BorderRadius.all(Radius.circular(38)),
//           onTap: () {
//                    NavigationServices(context).gotoSearchScreen();
//           },
//           child: CommonSearchBar(
//             iconData: FontAwesomeIcons.search,
//             enabled: false,
//             text: AppLocalizations(context).of("where_are_you_going"),
//           ),
//         ),
//       ),
//     );
//   }
// }