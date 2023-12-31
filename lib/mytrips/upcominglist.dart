import 'package:flutter/material.dart';
import 'package:yatra1/hoteldetail/roombookingscreen.dart';
import 'package:yatra1/mytrips/hotellistview.dart';

import 'package:yatra1/utilis/hotellistdata.dart';
class UpcomingListView extends StatefulWidget {
  final AnimationController animationController;

  const UpcomingListView({Key? key, required this.animationController})
      : super(key: key);

  @override
  _UpcomingListViewState createState() => _UpcomingListViewState();
}

class _UpcomingListViewState extends State<UpcomingListView> {
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
        padding: EdgeInsets.only(top: 8, bottom: 16),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          var count = hotelList.length > 10 ? 10 : hotelList.length;
          var animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController,
              curve: Interval((1 / count) * index, 1.0,
                  curve: Curves.fastOutSlowIn)));
          widget.animationController.forward();
          // Upcoming UI view and hotel list
          return HotelListView(
            callback: () {
              // Navigate to the room booking screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomBookingScreen(
                     hotelName: hotelList[index].titleTxt,  // Pass the correct argument
                    hotelTitle: hotelList[index].titleTxt,
                   
                    
                  ),
                ),
              );
            },
            hotelData: hotelList[index],
            animation: animation,
            animationController: widget.animationController,
            isShowDate: true,
          );
        },
      ),
    );
  }
}
