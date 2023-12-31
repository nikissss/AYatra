// import 'package:flutter/material.dart';
// import 'package:yatra1/screens/hotellistview.dart';
// import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
// import 'package:yatra1/utilis/hotellistdata.dart';

// class FavoritesListView extends StatefulWidget {
//   final AnimationController animationController;

//   const FavoritesListView({Key? key, required this.animationController})
//       : super(key: key);
//   @override
//   _FavoritesListViewState createState() => _FavoritesListViewState();
// }

// class _FavoritesListViewState extends State<FavoritesListView> {
//   var hotelList = HotelListData.hotelList;

//   @override
//   void initState() {
//     widget.animationController.forward();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//         itemCount: hotelList.length,
//         padding: EdgeInsets.only(top: 8, bottom: 8),
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           var count = hotelList.length > 10 ? 10 : hotelList.length;
//           var animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//               parent: widget.animationController,
//               curve: Interval((1 / count) * index, 1.0,
//                   curve: Curves.fastOutSlowIn)));
//           widget.animationController.forward();
//           //Favorites hotel data list and UI View
//           return HotelListViewPage(
//             callback: () {
//               NavigationServices(context)
//                   .gotoRoomBookingScreen(hotelList[index].titleTxt);
//             },
//             hotelData: hotelList[index],
//             animation: animation,
//             animationController: widget.animationController,
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:yatra1/hoteldetail/roombookingscreen.dart';
import 'package:yatra1/modules/hotellistviewpage.dart';
import 'package:yatra1/screens/hotellistview.dart';
import 'package:yatra1/utilis/hotellistdata.dart';

class FavoritesListView extends StatefulWidget {
  final AnimationController animationController;

  const FavoritesListView({Key? key, required this.animationController})
      : super(key: key);

  @override
  _FavoritesListViewState createState() => _FavoritesListViewState();
}

class _FavoritesListViewState extends State<FavoritesListView> {
  var hotelList = HotelListData.hotelList;

  @override
  void initState() {
    widget.animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: hotelList.length,
        padding: EdgeInsets.only(top: 8, bottom: 8),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          var count = hotelList.length > 10 ? 10 : hotelList.length;
          var animation = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: widget.animationController,
              curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
            ),
          );
          widget.animationController.forward();
          
          // Favorites hotel data list and UI View
          return HotelListViewPage(
            callback: () {
              // Navigate to the room booking screen with hotel title
              _gotoRoomBookingScreen(hotelList[index].titleTxt);
            },
            hotelData: hotelList[index],
            animation: animation,
            animationController: widget.animationController,
          );
        },
      ),
    );
  }

  // Function to navigate to the room booking screen
  void _gotoRoomBookingScreen(String hotelTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomBookingScreen(hotelTitle: hotelTitle, hotelName: '',),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:yatra1/hoteldetail/roombookingscreen.dart';
// // import 'package:yatra1/utilis/hotellistdata.dart';
// import 'package:yatra1/utils/helper.dart';
// import 'package:yatra1/utilis/hotellistmodel.dart';
// class FavoritesListView extends StatefulWidget {
//   final AnimationController animationController;

//   const FavoritesListView({Key? key, required this.animationController})
//       : super(key: key);

//   @override
//   _FavoritesListViewState createState() => _FavoritesListViewState();
// }

// class _FavoritesListViewState extends State<FavoritesListView> {
//   var hotelList = HotelListData.hotelList;

//   @override
//   void initState() {
//     widget.animationController.forward();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//         itemCount: hotelList.length,
//         padding: EdgeInsets.only(top: 8, bottom: 8),
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           var count = hotelList.length > 10 ? 10 : hotelList.length;
//           var animation = Tween(begin: 0.0, end: 1.0).animate(
//             CurvedAnimation(
//               parent: widget.animationController,
//               curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
//             ),
//           );
//           widget.animationController.forward();

//           // Favorites hotel data list and UI View
//           return buildHotelCard(hotelList[index], animation);
//         },
//       ),
//     );
//   }

//   Widget buildHotelCard(hotelData, Animation<double> animation) {
//     return GestureDetector(
//       onTap: () {
//         // Navigate to the room booking screen with hotel title
//         _gotoRoomBookingScreen(hotelData.titleTxt);
//       },
//       child: FadeTransition(
//         opacity: animation,
//         child: Container(
//           // Your hotel card UI goes here
//           // Use hotelData to display information about the hotel
//           child: Card(
//             child: ListTile(
//               title: Text(hotelData.titleTxt),
//               subtitle: Text(hotelData.subtitleTxt),
//               // Add other relevant information about the hotel
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Function to navigate to the room booking screen
//   void _gotoRoomBookingScreen(String hotelTitle) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => RoomBookingScreen(hotelTitle: hotelTitle, hotelName: '',),
//       ),
//     );
//   }
// }