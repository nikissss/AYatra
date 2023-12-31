class HotelListData {
String imagePath;
String titleTxt;
String subTxt;
double dist;
double rating;
int reviews;
int perNight;

HotelListData({
  this.imagePath='',
  this.titleTxt='',
  this.subTxt='',
  this.dist=1.8,
  this.rating=4.5,
  this.reviews=80,
  this.perNight=4000,
});

static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'lib/assets/images/tukiresort.jpg',
      titleTxt: 'Tuki Resort Pokhara',
      subTxt: 'Phewa lake,Pokhara',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 4000,
    ),
    HotelListData(
      imagePath: 'lib/assets/images/himalayan-front-at-night.jpg',
      titleTxt: 'Himalayan Front Hotel ',
      subTxt: 'Simpani,Pokhara',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 4500,
    ),
    HotelListData(
      imagePath: 'lib/assets/images/hotelsplendidviewpokhara.jpg',
      titleTxt: 'Splendid View',
      subTxt: 'lakeside,Pokhara',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 5000,
    ),
    HotelListData(
      imagePath: 'lib/assets/images/barpepalresort.jpg',
      titleTxt: 'Bar Peepal Resort',
      subTxt: 'Phewa lake,Pokhara',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 5200,
    ),
    HotelListData(
      imagePath: 'lib/assets/images/waterfrontresort.jpg',
      titleTxt: 'WaterFront Resort',
      subTxt: 'Phewa lake,Pokhara',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 5500,
    ),
  ];

  get roomData => null;

  String? get dateTxt => null;

}