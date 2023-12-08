import 'package:yatra1/utilis/Des-Model.dart';

List<Map<String, dynamic>> hotelList = [
  {
    'image': 'one.png',
    'place': 'Open Space',
    'destination': 'London',
    'price': 25
  },
  {
    'image': 'two.png',
    'place': 'Global Will',
    'destination': 'London',
    'price': 40
  },
  {
    'image': 'three.png',
    'place': 'Tallest Building',
    'destination': 'Dubai',
    'price': 68
  },
];

List<Map<String, dynamic>> ticketList = [
  {
    'from': {
      'code':"NYC",
      'name':"New-York"
    },
    'to': {
      'code':"LDN",
      'name':"London"
    },
    'flying_time': '8H 30M',
    'date': "1 MAY",
    'departure_time':"08:00 AM",
    "number":23
  },
  {
    'from': {
      'code':"DK",
      'name':"Dhaka"
    },
    'to': {
      'code':"SH",
      'name':"Shanghai"
    },
    'flying_time': '4H 20M',
    'date': "10 MAY",
    'departure_time':"09:00 AM",
    "number":45
  },
];


List<DesModel> DestinationList = [
  DesModel(
title:'London Tower', 
image: 'lib/images/londontower.jpeg',
  ),
DesModel(
title:' Palace of versailles Paris ',
image:'lib/images/palace of versailles paris.jpeg',
),
DesModel(
title:' Tuileries Garden Paris',
image:'lib/images/Tuileries Garden Paris.jpeg',
),
DesModel(
title:' Saint-Chapelle Paris',
image:'lib/images/Sainte-Chapelle paris.jpeg',
),
DesModel(
title:'Sphinx Observatory Switzerland',
image:'lib/images/Sphinx Observatory Switzerland.jpeg',
),
DesModel(
title:' Swiss National Museum,Switzerland',
image:'lib/images/swiss national museum switzerland.jpeg',
),
DesModel(
title:'Swiss National Park Switzerland',
image:'lib/images/swiss national park.jpeg',
),

DesModel(
title:'Rhine Falls ,Switzerland',
image:'lib/images/Rhine falls Switzerland.jpeg',
),
DesModel(
title:'Maldives',
image:'',
),
DesModel(
title:'Miracle Garden Dubai',
image:'lib/images/Miracle Garden Dubai.jpeg',
),
DesModel(
title:'Miracle Garden Dubai',
image:'lib/images/Museum of Future.jpeg',
),

DesModel(
title:'Lost Chamber Aquarium, Dubai',
image:'lib/images/Lost Chamber Aquarium Dubai.jpeg',
),
];

class Hotel {
  final String image;
  final String place;
  final String destination;
  final int price;

  Hotel({
    required this.image,
    required this.place,
    required this.destination,
    required this.price,
  });
}

