// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:yatra1/components/roompopupview.dart';
// import 'package:yatra1/hoteldetail/roombookingscreen.dart';
// import 'package:yatra1/utilis/hotel_theme.dart';
// import 'package:yatra1/utilis/hotellistmodel.dart';
// import 'package:yatra1/utilis/roomdata.dart';
// import 'package:yatra1/screens/hotellistview.dart';
// import 'package:yatra1/hoteldetail/filterscreen/filterscreen.dart';


// class HotelHomeScreen extends StatefulWidget {
//   const HotelHomeScreen({Key? key}) : super(key: key);

//   @override
//   _HotelHomeScreenState createState() => _HotelHomeScreenState();
// }
// class HotelData {
//   final String ownerId;
//   final String hotelName;
//   final String description;
//   final String imageUrl;

//   HotelData({
//     required this.ownerId,
//     required this.hotelName,
//     required this.description,
//     required this.imageUrl,
//   });
// }

// class _HotelHomeScreenState extends State<HotelHomeScreen> with TickerProviderStateMixin {
//   late AnimationController animationController;
//   var hotelList = HotelListData.hotelList;
//   ScrollController scrollController = ScrollController();

//   // int room = 1;
//   // int add = 2;
//    int selectedNumberRooms = 1;
//   int selectedAdults = 2;
//   int selectedChildren = 0;

//   DateTime startDate = DateTime.now();
//   DateTime endDate = DateTime.now().add(const Duration(days: 20));


// Future<void> _getHotels() async {
//   try {
//     final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('hotels').get();
//    final List<HotelData> hotels = snapshot.docs.map((DocumentSnapshot doc) {
//   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//   return HotelData(
//     ownerId: data['ownerId'],
//     hotelName: data['hotelName'],
//     description: data['description'],
//     imageUrl: data['imageUrl'],
//   );
// }).toList();

//     setState(() {
//       hotelList = hotels.cast<HotelListData>();
//     });
//   } catch (e) {
//     print('Error getting hotels: $e');
//   }
// }


//   @override
//   void initState() {
//     super.initState();
//       _getHotels();
//     animationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
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
//                       parent: animationController,
//                       curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
//                     ));
//                     animationController.forward();
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             // builder: (context) => RoomeBookView(
//                             //   roomData: hotelList[index].roomData,
//                             //   animationController: animationController,
//                             //   animation: animation,
//                             // ),
//                             builder:(context) => RoomBookingScreen(hotelName: '',hotelTitle: '',),
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

//  Widget getFilterBarUI() {
//     return Stack(
//       children: <Widget>[
//         Positioned(
//           top: 0,
//           left: 0,
//           right: 0,
//           child: Container(
//             height: 24,
//             decoration: BoxDecoration(
//               color: HotelTheme.buildLightTheme().backgroundColor,
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(0, 2),
//                   color: Colors.grey.withOpacity(0.2),
//                   blurRadius: 8.0,
//                 )
//               ],
//             ),
//           ),
//         ),
//         Container(
//           color: HotelTheme.buildLightTheme().backgroundColor,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Text(
//                       '5 hotels found',
//                       style: TextStyle(
//                         color:Colors.black,
//                         fontWeight: FontWeight.w700,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to the filter screen when the filter icon is clicked
//                      Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => FiltersScreen()),
// );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 8),
//                       child: Row(
//                         children: <Widget>[
//                           Text(
//                             'Filter',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 16,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Icon(
//                               Icons.sort,
//                               color: Colors.black, // Set the dark color here
//                               size: 24, // Set the icon size here
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }

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
// Widget getTimeDateUI(BuildContext context, DateTime startDate, DateTime endDate) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 18, bottom: 16),
//     child: Row(
//       children: <Widget>[
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               // Text(
//               //   "Choose Date",
//               //   style: const TextStyle(
//               //     fontSize: 16,
//               //     // fontWeight: FontWeight.w100,
//               //     color: Colors.black,
//               //   ),
//               // ),
//               const SizedBox(height: 8),
//               GestureDetector(
//                 onTap: () {
//                   // Show date picker when "Choose Date" is tapped
//                   _selectDate(context);
//                 },
//                 child: Text(
//                   "Choose date\n${DateFormat('dd,MMM').format(startDate)} - ${DateFormat('dd,MMM').format(endDate)}",
//                   style: const TextStyle(
//                     fontSize: 16,
//                     // fontWeight: FontWeight.w100,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//             ],
//           ),
//         ),
//         const SizedBox(width: 8),
//         // Expanded(
//         //   child: GestureDetector(
//         //     onTap: () {
//         //       // Navigate to RoomPopupView page when "Number of Rooms" is tapped
//         //       Navigator.push(
//         //         context,
//         //         MaterialPageRoute(builder: (context) => RoomPopupView(
//         //           barrierDismissible: true,
//         //          roomData: RoomData(numberRoom: selectedNumberRooms, adult: selectedAdults, children: selectedChildren),
 
//         //            onChnage: (RoomData roomData ) {  },
//         //            )
//         //            ),
//         //       );
//         //     },
//         //     child: Column(
//         //       crossAxisAlignment: CrossAxisAlignment.start,
//         //       children: <Widget>[
//         //         Text(
//         //           "Number of Rooms",
//         //           style: TextStyle(
//         //             // fontWeight: FontWeight.w100,
//         //             fontSize: 12,
//         //             color: Colors.black,
//         //           ),
//         //         ),
//         //         const SizedBox(height: 8),
//         //        Text(
//         //         "$selectedNumberRooms Room(s) - $selectedAdults Adult(s) & $selectedChildren Children",
//         //         style: TextStyle(
//         //           fontSize: 16,
//         //           color: Colors.black,
//         //         ),
//         //       ),
//         //       ],
//         //     ),
//         //   ),
//         // ),
//         Expanded(
//   child: GestureDetector(
//     onTap: () {
//       // Navigate to RoomPopupView page when "Number of Rooms" is tapped
//       RoomData selectedRoomData = _selectRoom(context);
//       // setState(() {
//       //   selectedNumberRooms = selectedRoomData.numberRoom;
//       //   selectedAdults = selectedRoomData.adult;
//       //   selectedChildren = selectedRoomData.children;
//       // });
//     },
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         // Text(
//         //   "Number of Rooms",
//         //   style: TextStyle(
//         //     fontSize: 12,
//         //     color: Colors.black,
//         //   ),
//         // ),
//         const SizedBox(height: 8),
//         Text(
//           "Number of Rooms\n$selectedNumberRooms Room(s)\n $selectedAdults Adult(s) & $selectedChildren Children",
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.black,
//           ),
//         ),
//       ],
//     ),
//   ),
// ),

//       ],
//     ),
//   );
// }

// Future<void> _selectDate(BuildContext context) async {
//   DateTimeRange? picked = await showDateRangePicker(
//     context: context,
//     firstDate: DateTime.now(),
//     lastDate: DateTime.now().add(const Duration(days: 20)),
//     builder: (BuildContext context, Widget? child) {
//       return Theme(
//         data: ThemeData.light().copyWith(
//           primaryColor: Colors.white, // Header background color
//           hintColor: Colors.black, // Color of the text in the header
//           colorScheme: ColorScheme.light(primary: Colors.black),
//           buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
//         ),
//         child: child!,
//       );
//     },
//   );
//   if (picked != null) {
//     // Handle the selected date range
//     // Update your startDate and endDate variables or perform other actions
//    await Future.delayed(Duration(milliseconds: 100));
//    setState(() {
//     startDate = picked.start;
//    endDate = picked.end;
//    });
//   }
// }

// //  Future<void> _selectRoom(BuildContext context) async {
// //     // Navigate to RoomPopupView page when "Number of Rooms" is tapped
// //     RoomData selectedRoomData = await Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => RoomPopupView(
// //           barrierDismissible: true,
// //           roomData: RoomData(numberRoom: selectedNumberRooms, adult: selectedAdults, children: selectedChildren),
// //           onChnage: (RoomData roomData) {
// //             // Update the selected data when RoomPopupView returns
// //             setState(() {
// //               selectedNumberRooms = roomData.numberRoom;
// //               selectedAdults= roomData.adult;
// //               selectedChildren= roomData.children;
// //             });
// //           },
// //         ),
// //       ),
// //     );

// //     // Additional logic after selecting room if needed
// //   }
// RoomData _selectRoom(BuildContext context) {
//   RoomData selectedRoomData = RoomData(
//     numberRoom: selectedNumberRooms,
//     adult: selectedAdults,
//     children: selectedChildren,
//   );

//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => RoomPopupView(
//         barrierDismissible: true,
//         roomData: selectedRoomData,
//         onChnage: (RoomData roomData) {
//           // Update the selected data when RoomPopupView returns
//           setState(() {
//             selectedNumberRooms = roomData.numberRoom;
//             selectedAdults = roomData.adult;
//             selectedChildren = roomData.children;
//           });
//         },
//       ),
//     ),
//   );

//   // Return the current selectedRoomData
//   return selectedRoomData;
// }

// }
//   Widget getAppBarUI(BuildContext context) {
//   return Container(
//     decoration: BoxDecoration(
//       color: HotelTheme.buildLightTheme().colorScheme.background,
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.2),
//           offset: const Offset(0, 2),
//           blurRadius: 8.0,
//         ),
//       ],
//     ),
//     child: Padding(
//       padding: EdgeInsets.only(
//         top: MediaQuery.of(context).padding.top,
//         left: 8,
//         right: 8,
//       ),
//       child: Row(
//         children: <Widget>[
//           Container(
//             alignment: Alignment.centerLeft,
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
//           SizedBox(height: 60,),
//           Expanded(
//             child: Center(
//               child: Text(
//                 "Book Your Hotel!",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20,
//                 ),
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
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
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


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yatra1/components/roompopupview.dart';
import 'package:yatra1/hoteldetail/roombookingscreen.dart';
import 'package:yatra1/utilis/hotel_theme.dart';
import 'package:yatra1/utilis/hotellistmodel.dart';
import 'package:yatra1/utilis/roomdata.dart';
import 'package:yatra1/screens/hotellistview.dart';
import 'package:yatra1/hoteldetail/filterscreen/filterscreen.dart';


class HotelHomeScreen extends StatefulWidget {
  const HotelHomeScreen({Key? key}) : super(key: key);

  @override
  _HotelHomeScreenState createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  //var hotelList = HotelListData.hotelList;
    List<HotelListData> hotelList = [];
  ScrollController scrollController = ScrollController();

  // int room = 1;
  // int add = 2;
   int selectedNumberRooms = 1;
  int selectedAdults = 2;
  int selectedChildren = 0;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 20));

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
     // Fetch hotel data from Firestore when the screen initializes
    fetchHotelData();
  }


  Future<void> fetchHotelData() async {
    // Fetch hotel data from Firestore and update the hotelList
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('hotels').get();

      final List<HotelListData> fetchedHotels = snapshot.docs.map((doc) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return HotelListData(
          imagePath: data['imageUrl'] ?? '',
          titleTxt: data['hotelName'] ?? '',
          subTxt: data['description'] ?? '',
          // Add other fields as needed
        );
      }).toList();

      setState(() {
        hotelList = fetchedHotels;
      });
    } catch (e) {
      print('Error fetching hotel data: $e');
    }
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
                            builder:(context) => RoomBookingScreen(  hotelName: hotelList[index].titleTxt,
                              hotelTitle: hotelList[index].titleTxt,),
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
                      '5 hotels found',
                      style: TextStyle(
                        color:Colors.black,
                        fontWeight: FontWeight.w700,
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
                              fontWeight: FontWeight.w700,
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
Widget getTimeDateUI(BuildContext context, DateTime startDate, DateTime endDate) {
  return Padding(
    padding: const EdgeInsets.only(left: 18, bottom: 16),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text(
              //   "Choose Date",
              //   style: const TextStyle(
              //     fontSize: 16,
              //     // fontWeight: FontWeight.w100,
              //     color: Colors.black,
              //   ),
              // ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  // Show date picker when "Choose Date" is tapped
                  _selectDate(context);
                },
                child: Text(
                  "Choose date\n${DateFormat('dd,MMM').format(startDate)} - ${DateFormat('dd,MMM').format(endDate)}",
                  style: const TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.w100,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Expanded(
        //   child: GestureDetector(
        //     onTap: () {
        //       // Navigate to RoomPopupView page when "Number of Rooms" is tapped
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => RoomPopupView(
        //           barrierDismissible: true,
        //          roomData: RoomData(numberRoom: selectedNumberRooms, adult: selectedAdults, children: selectedChildren),
 
        //            onChnage: (RoomData roomData ) {  },
        //            )
        //            ),
        //       );
        //     },
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         Text(
        //           "Number of Rooms",
        //           style: TextStyle(
        //             // fontWeight: FontWeight.w100,
        //             fontSize: 12,
        //             color: Colors.black,
        //           ),
        //         ),
        //         const SizedBox(height: 8),
        //        Text(
        //         "$selectedNumberRooms Room(s) - $selectedAdults Adult(s) & $selectedChildren Children",
        //         style: TextStyle(
        //           fontSize: 16,
        //           color: Colors.black,
        //         ),
        //       ),
        //       ],
        //     ),
        //   ),
        // ),
        Expanded(
  child: GestureDetector(
    onTap: () {
      // Navigate to RoomPopupView page when "Number of Rooms" is tapped
      RoomData selectedRoomData = _selectRoom(context);
      // setState(() {
      //   selectedNumberRooms = selectedRoomData.numberRoom;
      //   selectedAdults = selectedRoomData.adult;
      //   selectedChildren = selectedRoomData.children;
      // });
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   "Number of Rooms",
        //   style: TextStyle(
        //     fontSize: 12,
        //     color: Colors.black,
        //   ),
        // ),
        const SizedBox(height: 8),
        Text(
          "Number of Rooms\n$selectedNumberRooms Room(s)\n $selectedAdults Adult(s) & $selectedChildren Children",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
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
  DateTimeRange? picked = await showDateRangePicker(
    context: context,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 20)),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: Colors.white, // Header background color
          hintColor: Colors.black, // Color of the text in the header
          colorScheme: ColorScheme.light(primary: Colors.black),
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: child!,
      );
    },
  );
  if (picked != null) {
    // Handle the selected date range
    // Update your startDate and endDate variables or perform other actions
   await Future.delayed(Duration(milliseconds: 100));
   setState(() {
    startDate = picked.start;
   endDate = picked.end;
   });
  }
}

//  Future<void> _selectRoom(BuildContext context) async {
//     // Navigate to RoomPopupView page when "Number of Rooms" is tapped
//     RoomData selectedRoomData = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => RoomPopupView(
//           barrierDismissible: true,
//           roomData: RoomData(numberRoom: selectedNumberRooms, adult: selectedAdults, children: selectedChildren),
//           onChnage: (RoomData roomData) {
//             // Update the selected data when RoomPopupView returns
//             setState(() {
//               selectedNumberRooms = roomData.numberRoom;
//               selectedAdults= roomData.adult;
//               selectedChildren= roomData.children;
//             });
//           },
//         ),
//       ),
//     );

//     // Additional logic after selecting room if needed
//   }
RoomData _selectRoom(BuildContext context) {
  RoomData selectedRoomData = RoomData(
    numberRoom: selectedNumberRooms,
    adult: selectedAdults,
    children: selectedChildren,
  );

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RoomPopupView(
        barrierDismissible: true,
        roomData: selectedRoomData,
        onChnage: (RoomData roomData) {
          // Update the selected data when RoomPopupView returns
          setState(() {
            selectedNumberRooms = roomData.numberRoom;
            selectedAdults = roomData.adult;
            selectedChildren = roomData.children;
          });
        },
      ),
    ),
  );

  // Return the current selectedRoomData
  return selectedRoomData;
}

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
          SizedBox(height: 60,),
          Expanded(
            child: Center(
              child: Text(
                "Book Your Hotel!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
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