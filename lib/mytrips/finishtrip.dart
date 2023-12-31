// import 'package:flutter/material.dart';
// import 'package:yatra1/hoteldetail/roombookingscreen.dart';
// import 'package:yatra1/mytrips/hotellistviewdata.dart';
// import 'package:yatra1/utilis/hotellistdata.dart';

// class FinishTripView extends StatefulWidget {
//   final AnimationController animationController;

//   const FinishTripView({Key? key, required this.animationController})
//       : super(key: key);

//   @override
//   _FinishTripViewState createState() => _FinishTripViewState();
// }

// class _FinishTripViewState extends State<FinishTripView> {
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
//         padding: EdgeInsets.only(top: 8, bottom: 16),
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           var count = hotelList.length > 10 ? 10 : hotelList.length;
//           var animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//               parent: widget.animationController,
//               curve: Interval((1 / count) * index, 1.0,
//                   curve: Curves.fastOutSlowIn)));
//           widget.animationController.forward();
//           //Finished hotel data list and UI View
//           return HotelListViewData(
//             callback: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => RoomBookingScreen(
//                     hotelTitle: hotelList[index].titleTxt,
//                       hotelName: hotelList[index].titleTxt
//                   ),
//                 ),
//               );
//             },
//             hotelData: hotelList[index],
//             animation: animation,
//             animationController: widget.animationController,
//             isShowDate: (index % 2) != 0,
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:yatra1/hoteldetail/roombookingscreen.dart';
import 'package:yatra1/mytrips/hotellistviewdata.dart';
import 'package:yatra1/utilis/hotellistdata.dart';

class FinishTripView extends StatefulWidget {
  final AnimationController animationController;

  const FinishTripView({Key? key, required this.animationController})
      : super(key: key);

  @override
  _FinishTripViewState createState() => _FinishTripViewState();
}

class _FinishTripViewState extends State<FinishTripView> {
  var hotelList = HotelListData.hotelList;

  @override
  void initState() {
    widget.animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: hotelList.length,
          padding: EdgeInsets.only(top: 8, bottom: 16),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var count = hotelList.length > 10 ? 10 : hotelList.length;
            var animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController,
              curve: Interval(
                (1 / count) * index,
                1.0,
                curve: Curves.fastOutSlowIn,
              ),
            ));
            widget.animationController.forward();

            // Finished hotel data list and UI View
            return HotelListViewData(
              callback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoomBookingScreen(
                      hotelTitle: hotelList[index].titleTxt,
                      hotelName: hotelList[index].titleTxt,
                      
                    ),
                  ),
                );
              },
              hotelData: hotelList[index],
              animation: animation,
              animationController: widget.animationController,
              isShowDate: (index % 2) != 0,
            );
          },
        ),
      ),
    );
  }
}
