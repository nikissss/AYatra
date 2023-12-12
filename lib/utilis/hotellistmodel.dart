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
  this.perNight=180,
});

static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'lib/images/Tuki resort,Pokhara.webp',
      titleTxt: 'Tuki Resort Pokhara',
      subTxt: 'Phewa lake,Pokhara',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
    ),
    HotelListData(
      imagePath: 'lib/images/Himalayan front hotel Pokhara.avif',
      titleTxt: 'Himalayan Front Hotel ',
      subTxt: 'Simpani,Pokhara',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 200,
    ),
    HotelListData(
      imagePath: 'lib/images/Hotel Splendid View Pokhara.avif',
      titleTxt: 'Splendid View',
      subTxt: 'lakeside,Pokhara',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 60,
    ),
    HotelListData(
      imagePath: 'lib/images/Bar Pepal Resort Pokhara.avif',
      titleTxt: 'Bar Peepal Resort',
      subTxt: 'Phewa lake,Pokhara',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 170,
    ),
    HotelListData(
      imagePath: 'lib/images/f95d55c6ae3111e7af770a9df65c8753.jpg.avif',
      titleTxt: 'WaterFront Resort',
      subTxt: 'Phewa lake,Pokhara',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 200,
    ),
  ];

  get roomData => null;

  String? get dateTxt => null;

}