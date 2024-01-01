



// import 'package:yatra1/utilis/hotellistmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:yatra1/utilis/roomdata.dart';
// import 'package:yatra1/utils/localfiles.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class HotelListData{
//   final String imagePath;
//  final String titleTxt;
//   String subTxt;
//   DateText? date;
//   String dateTxt;
//   String roomSizeTxt;
//  final RoomData? roomData;
//   double dist;
//   double rating;
//   int reviews;
//  final int perNight;
//   bool isSelected;
//   PeopleSleeps? peopleSleeps;
//   LatLng? location;
//   Offset? screenMapPin; // we used this screen Offset for adding on Map layer

//   HotelListData({
//     this.imagePath = '',
//     this.titleTxt = '',
//     this.subTxt = "",
//     this.dateTxt = "",
//     this.roomSizeTxt = "",
//     this.roomData,
//     this.dist = 1.8,
//     this.reviews = 80,
//     this.rating = 4.5,
//     this.perNight = 4000,
//     this.isSelected = false,
//     this.date,
//     this.peopleSleeps,
//     this.location,
//     this.screenMapPin,
//   });

//   // we need location in this hotelList bcz we using that in map
//   static List<HotelListData> hotelList = [
//     HotelListData(
//       imagePath: 'lib/assets/images/tukiresort.jpg',
//       titleTxt: 'Tuki Resort Pokhara',
//       subTxt: 'Phewa lake,Pokhara',
//       dist: 2.0,
//       reviews: 80,
//       rating: 4.4,
//       perNight: 4000,
//       roomData: RoomData(1, 2),
//       isSelected: true,
//       date: DateText(1, 5),
//       location: LatLng(51.516898, -0.143377),
//     ),
//     HotelListData(
//       imagePath: 'lib/assets/images/himalayan-front-at-night.jpg',
//       titleTxt: 'Himalayan Front Hotel ',
//       subTxt: 'Simpani,Pokhara',
//       dist: 4.0,
//       reviews: 74,
//       rating: 4.5,
//       perNight: 4500,
//       roomData: RoomData(1, 3),
//       isSelected: false,
//       date: DateText(2, 6),
//       location: LatLng(51.505799, -0.137904),
//     ),
//     HotelListData(
//       imagePath: 'lib/assets/images/hotelsplendidviewpokhara.jpg',
//       titleTxt: 'Splendid View',
//       subTxt: 'lakeside,Pokhara',
//       dist: 3.0,
//       reviews: 62,
//       rating: 4.0,
//       perNight: 5000,
//       roomData: RoomData(2, 3),
//       isSelected: false,
//       date: DateText(5, 9),
//       location: LatLng(51.499162, -0.119788),
//     ),
//     HotelListData(
//       imagePath: 'lib/assets/images/barpepalresort.jpg',
//       titleTxt: 'Bar Peepal Resort',
//       subTxt: 'Phewa lake,Pokhara',
//       dist: 7.0,
//       reviews: 90,
//       rating: 4.4,
//       perNight: 5200,
//       isSelected: false,
//       roomData: RoomData(2, 2),
//       date: DateText(1, 5),
//       location: LatLng(51.519541, -0.114503),
//     ),
//     HotelListData(
//       imagePath: 'lib/assets/images/waterfrontresort.jpg',
//       titleTxt: 'WaterFront Resort',
//       subTxt: 'Phewa lake,Pokhara',
//       dist: 2.0,
//       reviews: 240,
//       rating: 4.5,
//       isSelected: false,
//       perNight: 5500,
//       roomData: RoomData(1, 7),
//       date: DateText(1, 4),
//       location: LatLng(51.508383, -0.109502),
//     ),
//   ];

//   static List<HotelListData> popularList = [
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Paris',
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Spain',
//     ),
//     HotelListData(
//       imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Vernazza',
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'London',
//     ),
//     HotelListData(
//       imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Venice',
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Diamond Head',
//     ),
//   ];

//   static List<HotelListData> reviewsList = [
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Alexia Jane',
//       subTxt:
//           'This is located in a great spot close to shops and bars, very quiet location',
//       rating: 8.0,
//       dateTxt: '21 May, 2019',
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Jacky Depp',
//       subTxt:
//           'Good staff, very comfortable bed, very quiet location, place could do with an update',
//       rating: 8.0,
//       dateTxt: '21 May, 2019',
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Alex Carl',
//       subTxt:
//           'This is located in a great spot close to shops and bars, very quiet location',
//       rating: 6.0,
//       dateTxt: '21 May, 2019',
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'May June',
//       subTxt:
//           'Good staff, very comfortable bed, very quiet location, place could do with an update',
//       rating: 9.0,
//       dateTxt: '21 May, 2019',
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Lesley Rivas',
//       subTxt:
//           'This is located in a great spot close to shops and bars, very quiet location',
//       rating: 8.0,
//       dateTxt: '21 May, 2019',
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Carlos Lasmar',
//       subTxt:
//           'Good staff, very comfortable bed, very quiet location, place could do with an update',
//       rating: 7.0,
//       dateTxt: '21 May, 2019',
//     ),
//     HotelListData(
//       imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Oliver Smith',
//       subTxt:
//           'This is located in a great spot close to shops and bars, very quiet location',
//       rating: 9.0,
//       dateTxt: '21 May, 2019',
//     ),
//   ];

//   static List<HotelListData> romeList = [
//     HotelListData(
//         imagePath:
//             'assets/images/room_1.jpg assets/images/room_2.jpg assets/images/room_3.jpg',
//         titleTxt: 'Deluxe Room',
//         perNight: 4000,
//         dateTxt: 'Sleeps 3 people',
//         roomData: RoomData(2, 2)),
//     HotelListData(
//         imagePath:
//             'assets/images/room_4.jpg assets/images/room_5.jpg assets/images/room_6.jpg',
//         titleTxt: 'Premium Room',
//         perNight: 4500,
//         dateTxt: 'Sleeps 3 people + 2 children',
//         roomData: RoomData(3, 2)),
//     HotelListData(
//         imagePath:
//             'assets/images/room_7.jpg assets/images/room_8.jpg assets/images/room_9.jpg',
//         titleTxt: 'Queen Room',
//         perNight: 5000,
//         dateTxt: 'Sleeps 4 people + 4 children',
//         roomData: RoomData(4, 4)),
//     HotelListData(
//         imagePath:
//             'assets/images/room_10.jpg assets/images/room_11.jpg assets/images/room_12.jpg',
//         titleTxt: 'King Room',
//         perNight: 5200,
//         dateTxt: 'Sleeps 4 people + 4 children',
//         roomData: RoomData(4, 4)),
//     HotelListData(
//         imagePath:
//             'assets/images/room_11.jpg assets/images/room_1.jpg assets/images/room_2.jpg',
//         titleTxt: 'Hollywood Twin\nRoom',
//         perNight: 5500,
//         dateTxt: 'Sleeps 4 people + 4 children',
//         roomData: RoomData(4, 4)),
//   ];

//   static List<HotelListData> hotelTypeList = [
//     HotelListData(
//       imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'hotel_data',
//       isSelected: false,
//     ),
//     HotelListData(
//       imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Backpacker_data',
//       isSelected: false,
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Resort_data',
//       isSelected: false,
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'villa_data',
//       isSelected: false,
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'apartment',
//       isSelected: false,
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'guest_house',
//       isSelected: false,
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif7',
//       titleTxt: 'motel',
//       isSelected: false,
//     ),
//     HotelListData(
//       imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'accommodation',
//       isSelected: false,
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Bed_breakfast',
//       isSelected: false,
//     ),
//   ];
//   static List<HotelListData> lastsSearchesList = [
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'London',
//       roomData: RoomData(1, 3),
//       date: DateText(12, 22),
//       dateTxt: '12 - 22 Dec',
//     ),
//     HotelListData(
//       imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Paris',
//       roomData: RoomData(1, 3),
//       date: DateText(12, 24),
//       dateTxt: '12 - 24 Sep',
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'New York',
//       roomData: RoomData(1, 3),
//       date: DateText(20, 22),
//       dateTxt: '20 - 22 Sep',
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Tokyo',
//       roomData: RoomData(12, 22),
//       date: DateText(12, 22),
//       dateTxt: '12 - 22 Nov',
//     ),
//     HotelListData(
//       imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Shanghai',
//       roomData: RoomData(10, 15),
//       date: DateText(10, 15),
//       dateTxt: '10 - 15 Dec',
//     ),
//     HotelListData(
//       imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
//       titleTxt: 'Moscow',
//       roomData: RoomData(12, 14),
//       date: DateText(12, 14),
//       dateTxt: '12 - 14 Dec',
//     ),
//   ];
// }

// class PeopleSleeps {
// }

// class RoomData {
//    int numberOfPeople;
//   int numberOfRooms;

//   RoomData(this.numberOfPeople, this.numberOfRooms);
// }

// class DateText {

//   int startDate;
//   int endDate;

//   DateText(this.startDate, this.endDate);

// }




import 'package:yatra1/utilis/hotellistmodel.dart';
import 'package:flutter/material.dart';
import 'package:yatra1/utilis/roomdata.dart';
import 'package:yatra1/utils/localfiles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HotelListData{
  final String imagePath;
 final String titleTxt;
  String subTxt;
  DateText? date;
  String dateTxt;
  String roomSizeTxt;
 final RoomData? roomData;
  double dist;
  double rating;
  int reviews;
 final int perNight;
  bool isSelected;
  PeopleSleeps? peopleSleeps;
  LatLng? location;
  Offset? screenMapPin; // we used this screen Offset for adding on Map layer

  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dateTxt = "",
    this.roomSizeTxt = "",
    this.roomData,
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 4000,
    this.isSelected = false,
    this.date,
    this.peopleSleeps,
    this.location,
    this.screenMapPin,
  });


  // we need location in this hotelList bcz we using that in map
  static List<HotelListData> hotelList = [
    HotelListData(
      imagePath: 'lib/assets/images/tukiresort.jpg',
      titleTxt: 'Tuki Resort Pokhara',
      subTxt: 'Phewa lake,Pokhara',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 4000,
      roomData: RoomData(1, 2),
      isSelected: true,
      date: DateText(1, 5),
      location: LatLng(51.516898, -0.143377),
    ),
    HotelListData(
      imagePath: 'lib/assets/images/himalayan-front-at-night.jpg',
      titleTxt: 'Himalayan Front Hotel ',
      subTxt: 'Simpani,Pokhara',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 4500,
      roomData: RoomData(1, 3),
      isSelected: false,
      date: DateText(2, 6),
      location: LatLng(51.505799, -0.137904),
    ),
    HotelListData(
      imagePath: 'lib/assets/images/hotelsplendidviewpokhara.jpg',
      titleTxt: 'Splendid View',
      subTxt: 'lakeside,Pokhara',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 5000,
      roomData: RoomData(2, 3),
      isSelected: false,
      date: DateText(5, 9),
      location: LatLng(51.499162, -0.119788),
    ),
    HotelListData(
      imagePath: 'lib/assets/images/barpepalresort.jpg',
      titleTxt: 'Bar Peepal Resort',
      subTxt: 'Phewa lake,Pokhara',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 5200,
      isSelected: false,
      roomData: RoomData(2, 2),
      date: DateText(1, 5),
      location: LatLng(51.519541, -0.114503),
    ),
    HotelListData(
      imagePath: 'lib/assets/images/waterfrontresort.jpg',
      titleTxt: 'WaterFront Resort',
      subTxt: 'Phewa lake,Pokhara',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      isSelected: false,
      perNight: 5500,
      roomData: RoomData(1, 7),
      date: DateText(1, 4),
      location: LatLng(51.508383, -0.109502),
    ),
  ];

  static List<HotelListData> popularList = [
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Paris',
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Spain',
    ),
    HotelListData(
      imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Vernazza',
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'London',
    ),
    HotelListData(
      imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Venice',
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Diamond Head',
    ),
  ];

  static List<HotelListData> reviewsList = [
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Alexia Jane',
      subTxt:
          'This is located in a great spot close to shops and bars, very quiet location',
      rating: 8.0,
      dateTxt: '21 May, 2019',
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Jacky Depp',
      subTxt:
          'Good staff, very comfortable bed, very quiet location, place could do with an update',
      rating: 8.0,
      dateTxt: '21 May, 2019',
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Alex Carl',
      subTxt:
          'This is located in a great spot close to shops and bars, very quiet location',
      rating: 6.0,
      dateTxt: '21 May, 2019',
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'May June',
      subTxt:
          'Good staff, very comfortable bed, very quiet location, place could do with an update',
      rating: 9.0,
      dateTxt: '21 May, 2019',
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Lesley Rivas',
      subTxt:
          'This is located in a great spot close to shops and bars, very quiet location',
      rating: 8.0,
      dateTxt: '21 May, 2019',
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Carlos Lasmar',
      subTxt:
          'Good staff, very comfortable bed, very quiet location, place could do with an update',
      rating: 7.0,
      dateTxt: '21 May, 2019',
    ),
    HotelListData(
      imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Oliver Smith',
      subTxt:
          'This is located in a great spot close to shops and bars, very quiet location',
      rating: 9.0,
      dateTxt: '21 May, 2019',
    ),
  ];

  static List<HotelListData> romeList = [
    HotelListData(
        imagePath:
            'assets/images/room_1.jpg assets/images/room_2.jpg assets/images/room_3.jpg',
        titleTxt: 'Deluxe Room',
        perNight: 4000,
        dateTxt: 'Sleeps 3 people',
        roomData: RoomData(2, 2)),
    HotelListData(
        imagePath:
            'assets/images/room_4.jpg assets/images/room_5.jpg assets/images/room_6.jpg',
        titleTxt: 'Premium Room',
        perNight: 4500,
        dateTxt: 'Sleeps 3 people + 2 children',
        roomData: RoomData(3, 2)),
    HotelListData(
        imagePath:
            'assets/images/room_7.jpg assets/images/room_8.jpg assets/images/room_9.jpg',
        titleTxt: 'Queen Room',
        perNight: 5000,
        dateTxt: 'Sleeps 4 people + 4 children',
        roomData: RoomData(4, 4)),
    HotelListData(
        imagePath:
            'assets/images/room_10.jpg assets/images/room_11.jpg assets/images/room_12.jpg',
        titleTxt: 'King Room',
        perNight: 5200,
        dateTxt: 'Sleeps 4 people + 4 children',
        roomData: RoomData(4, 4)),
    HotelListData(
        imagePath:
            'assets/images/room_11.jpg assets/images/room_1.jpg assets/images/room_2.jpg',
        titleTxt: 'Hollywood Twin\nRoom',
        perNight: 5500,
        dateTxt: 'Sleeps 4 people + 4 children',
        roomData: RoomData(4, 4)),
  ];

  static List<HotelListData> hotelTypeList = [
    HotelListData(
      imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'hotel_data',
      isSelected: false,
    ),
    HotelListData(
      imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Backpacker_data',
      isSelected: false,
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Resort_data',
      isSelected: false,
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'villa_data',
      isSelected: false,
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'apartment',
      isSelected: false,
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'guest_house',
      isSelected: false,
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif7',
      titleTxt: 'motel',
      isSelected: false,
    ),
    HotelListData(
      imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'accommodation',
      isSelected: false,
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Bed_breakfast',
      isSelected: false,
    ),
  ];
  static List<HotelListData> lastsSearchesList = [
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'London',
      roomData: RoomData(1, 3),
      date: DateText(12, 22),
      dateTxt: '12 - 22 Dec',
    ),
    HotelListData(
      imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Paris',
      roomData: RoomData(1, 3),
      date: DateText(12, 24),
      dateTxt: '12 - 24 Sep',
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'New York',
      roomData: RoomData(1, 3),
      date: DateText(20, 22),
      dateTxt: '20 - 22 Sep',
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Tokyo',
      roomData: RoomData(12, 22),
      date: DateText(12, 22),
      dateTxt: '12 - 22 Nov',
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Shanghai',
      roomData: RoomData(10, 15),
      date: DateText(10, 15),
      dateTxt: '10 - 15 Dec',
    ),
    HotelListData(
      imagePath:'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Moscow',
      roomData: RoomData(12, 14),
      date: DateText(12, 14),
      dateTxt: '12 - 14 Dec',
    ),
  ];
}

class PeopleSleeps {
}

class RoomData {
   int numberOfPeople;
  int numberOfRooms;

  RoomData(this.numberOfPeople, this.numberOfRooms);
}

class DateText {

  int startDate;
  int endDate;

  DateText(this.startDate, this.endDate);

}