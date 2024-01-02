// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:country_picker/country_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:intl/intl.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server/gmail.dart';
// import 'package:yatra1/screens/list_flight_screen.dart';
// import 'package:yatra1/utilis/applayout.dart';
// import 'package:yatra1/utilis/app_styles.dart';
// import 'package:yatra1/utilis/dummy_data.dart';
// import 'package:yatra1/utilis/flight_model.dart';
// import 'package:csc_picker/csc_picker.dart';


// class OneWayTicket extends StatefulWidget {
//   const OneWayTicket({Key? key}) : super(key: key);

//   @override
//   State<OneWayTicket> createState() => _OneWayTicketState();
// }
//  List<Map<String,dynamic>> _allUsers = [
//     {"id":1, "name":"Kathmandu"},
//     {"id":2, "name":"Pokhara"},
//     {"id":3, "name":"Surkhet"},
//     {"id":4, "name":"Bhadrapur"},
//     {"id":5, "name":"Biratnagar"},
//     {"id":6, "name":"Illam"},
//     {"id":7, "name":"Chitwan"},
//     {"id":8, "name":"Mustang"},
//   ];
//   String selectedCity1 = '';
//   String selectedCity2 = '';
// class _OneWayTicketState extends State<OneWayTicket> {
//   DateTime _departureDate = DateTime.now();
//   bool _isDepartureDateSelected = true;
//   int _selectedAdultValue = 0;
//   int _selectedChildValue = 0;
//   String countryCode = "";
//   String countryCode1 = "";
//   String selectedOptions = "";
//   late String d_country;
//   late String a_country;
  
//   String get userEmailAddress => '';


//   void _showDatePicker() {
//     showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2024, 1, 10),
//     ).then((value) {
//       if (value != null) {
//         setState(() {
//           if (_isDepartureDateSelected) {
//             _departureDate = value;
//           } else {}
//         });
//       }
//     });
//   }

// Future<void> sendFlightDetailsEmail(
//   String recipientEmail,
//   String departureCountry,
//   String arrivalCountry,
//   DateTime departureDate,
//   int adults,
//   int children,
//   String paymentReference,
// ) async {
//  final smtpServer = gmail('pujakadayat1@gmail.com', 'zire chgc uvih tndh');// Replace with your email credentials

//   // Create the email message
//   final message = Message()
//     ..from = Address('yatra@gmail.com', 'Yatra')
//     ..recipients.add(recipientEmail)
//     ..subject = 'Flight Details'
//     ..text = 'Your flight details:\n\n'
//         'From: $departureCountry\n'
//         'To: $arrivalCountry\n'
//         'Departure Date: ${DateFormat('yyyy-MM-dd').format(departureDate)}\n'
//         'Adults: $adults\n'
//         'Children: $children\n\n'
//         'Payment Reference: $paymentReference\n'
//         'Thank you for booking your flight with us!';

//   try {
//     // Send the email
//     final sendReport = await send(message, smtpServer);

//     print('Flight details email sent: ' + sendReport.toString());
//   } catch (e) {
//     print('Error sending flight details email: $e');
//   }
// }


//   Future<void> bookFlight(String paymentReference) async {
//     try {
//       User? user = FirebaseAuth.instance.currentUser;
//       String? userEmail = user?.email;

//       if (userEmail != null) {
//         // Store flight booking information in Cloud Firestore
//         DocumentReference bookingReference = await FirebaseFirestore.instance.collection('flight_bookings').add({
//           'userEmail': userEmail,
//           'departureCountry': countryCode,
//           'arrivalCountry': countryCode1,
//           'departureDate': _departureDate,
//           'adults': _selectedAdultValue,
//           'children': _selectedChildValue,
//           'paymentReference': paymentReference,
//         });

//         // Send flight booking confirmation email
//         await sendFlightBookingConfirmationEmail(
//           userEmail,
//           countryCode,
//           countryCode1,
//           _departureDate,
//           _selectedAdultValue,
//           _selectedChildValue,
//           paymentReference,
//         );

//         print('Flight booking successful!');
//         // Consider showing a confirmation message or navigating to another screen.

//         // Optionally, you can get the booking ID from Firestore and use it as needed
//         String bookingId = bookingReference.id;
//         print('Booking ID: $bookingId');
//       } else {
//         print('User not logged in or email is null.');
//       }
//     } catch (e) {
//       print('Error booking flight: $e');
//     }
//   }

//   Future<void> sendFlightBookingConfirmationEmail(
//     String recipientEmail,
//     String departureCountry,
//     String arrivalCountry,
//     DateTime departureDate,
//     int adults,
//     int children,
//     String paymentReference,
//   ) async {
//     final smtpServer = gmail('pujakadayat1@gmail.com', 'zire chgc uvih tndh');

//     // Create the email message
//     final message = Message()
//       ..from = Address('yatra@gmail.com', 'Yatra')
//       ..recipients.add(recipientEmail)
//       ..subject = 'Flight Booking Confirmation'
//       ..text = 'Thank you for booking your flight with us!\n\n'
//           'From: $departureCountry\n'
//           'To: $arrivalCountry\n'
//           'Departure Date: ${DateFormat('yyyy-MM-dd').format(departureDate)}\n'
//           'Adults: $adults\n'
//           'Children: $children\n\n'
//           'Your flight booking is confirmed.\n'
//           'Payment Reference: $paymentReference';

//     try {
//   // Send the email
//   final sendReport = await send(message, smtpServer);
//   print('Flight booking confirmation email sent: ' + sendReport.toString());
// } catch (e) {
//   print('Error sending flight booking confirmation email: $e');
// }
//   }
// void onSuccess(PaymentSuccessModel success) async {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text("Payment Successful"),
//         actions: [
//           SimpleDialogOption(
//             child: const Text("OK"),
//             onPressed: () {
//               setState(() {
//                 var referenceId = success.idx;
//               });
//               Navigator.pop(context);

//               // Call the sendFlightDetailsEmail function with the payment reference code
//               sendFlightDetailsEmail(
//               userEmailAddress,  // Pass the user email address here
//                 countryCode,  // Pass the departure country code here
//                 countryCode1,  // Pass the arrival country code here
//                 _departureDate,
//                 _selectedAdultValue,
//                 _selectedChildValue,
//                 success.idx,
//               );
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

//   void updateSelectedOptions() {
//     setState(() {
//       selectedOptions =
//           "From: $countryCode\nTo: $countryCode1\nDeparture Date: ${DateFormat('yyyy-MM-dd').format(_departureDate)}\nAdults: $_selectedAdultValue\nChildren: $_selectedChildValue";
//     });
//   }
  
//   //   List<FlightModel> flights = []; // Initialize an empty list
//   // String previousDepartureCountry = "";
//   // String previousArrivalCountry = "";
//   @override
//   Widget build(BuildContext context) {
//     final size = AppLayout.getSize(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("One-Way-Ticket"),
//         backgroundColor: Colors.blueGrey,
//       ),
//       backgroundColor: Styles.bgColor,
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         children: [
//           const Gap(40),
//           Text(
//             "What are\nyou looking for?",
//             style: Styles.headLinestyle1.copyWith(fontSize: 35),
//           ),
//           const Gap(40),
//           Container(
//             width: size.width * 0.44,
//             height: size.width * 0.07,
//             padding: const EdgeInsets.all(3.5),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50),
//               color: Color(0xFFF4F6FD),
//             ),
//             child: Center(child: Text("Airlines")),
//           ),
//           const Gap(10),
//           Container(
//             width: size.width * 0.44,
//             height: size.width * 0.07,
//             padding: const EdgeInsets.all(3.5),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50),
//               color: Color(0xFFF4F6FD),
//             ),
//             child: Center(child: Text("One-Way-Tickets")),
//           ),
//           const Gap(10),
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//             ),
//             child: Row(
//               children: [
//                 Row(
//                   children: [
//                     Icon(Icons.flight_takeoff_rounded, color: Color(0xFFBFC2DF)),
//                     TextButton(
//   onPressed: () {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 200, // Set the desired height
//           child: ListView.builder(
//             itemCount: _allUsers.length,
//             itemBuilder: (BuildContext context, int index) {
//               final user = _allUsers[index];
//               return ListTile(
//                 title: Text(user['name']),
//                 onTap: () {
//                   // Handle selection of the city (user['name'])
//                   print('Selected city: ${user['name']}');
//                   setState(() {
//                     selectedCity1 = user['name']; // Assuming you have a variable named selectedCity
//                   });
//                   Navigator.pop(context);
//                 },
//               );
//             },
//           ),
//         );
//       },
//     );
//   },
//   child: Text(selectedCity1.isNotEmpty ? selectedCity1 : "Select City"),
// ),
//                     const Gap(100),
//                     Icon(Icons.flight_land_rounded, color: Color(0xFFBFC2DF)),
//                      TextButton(
//   onPressed: () {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 200, // Set the desired height
//           child: ListView.builder(
//             itemCount: _allUsers.length,
//             itemBuilder: (BuildContext context, int index) {
//               final user = _allUsers[index];
//               return ListTile(
//                 title: Text(user['name']),
//                 onTap: () {
//                   // Handle selection of the city (user['name'])
//                   print('Selected city: ${user['name']}');
//                   setState(() {
//                     selectedCity2 = user['name']; // Assuming you have a variable named selectedCity
//                   });
//                   Navigator.pop(context);
//                 },
//               );
//             },
//           ),
//         );
//       },
//     );
//   },
//   child: Text(selectedCity2.isNotEmpty ? selectedCity2 : "Select City"),
// ),
//     //                   TextButton(
//     //   onPressed: () {
//     //     showDialog(
//     //       context: context,
//     //       builder: (BuildContext context) {
//     //         return AlertDialog(
//     //           content: Container(
//     //             width: double.maxFinite,
//     //             child: CSCPicker(
//     //               onCountryChanged: (country){},
//     //               onStateChanged: (state){},
//     //               onCityChanged: (city){},
//     //               // onCountryChanged: (value) {
//     //               //   // Handle country change if needed
//     //               // },
//     //               // onStateChanged: (value) {
//     //               //   // Handle state change if needed
//     //               // },
//     //               // onCityChanged: (value) {
//     //               //   setState(() {
//     //               //     countryCode1 = value ?? '';
//     //               //   });
//     //               //   Navigator.pop(context); // Close the dialog
//     //               // },
//     //             ),
//     //           ),
//     //         );
//     //       },
//     //     );
//     //   },
//     //   child: Text(countryCode1.isNotEmpty ? countryCode1 : "Select City"),
//     // )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const Gap(10),
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.flight_takeoff_rounded, color: Color(0xFFBFC2DF)),
//                 const Gap(10),
//                 Text("Departure", style: Styles.textstyle),
//                 const Gap(30),
//                 Row(
//                   children: [
//                     Text(DateFormat('yyyy-MM-dd').format(_departureDate)),
//                     const Gap(17),
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           _isDepartureDateSelected = true;
//                         });
//                         _showDatePicker();
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.all(6.0),
//                         child: Text("Choose date"),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const Gap(10),
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.people_alt_rounded, color: Color(0xFFBFC2DF)),
//                 const Gap(10),
//                 Text("No. of people", style: Styles.textstyle),
//                 const Gap(30),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CupertinoButton.filled(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 6, horizontal: 6),
//                       child: Text("Adult = $_selectedAdultValue"),
//                       onPressed: () => showCupertinoModalPopup(
//                         context: context,
//                         builder: (_) => SizedBox(
//                           width: double.infinity,
//                           height: 250,
//                           child: CupertinoPicker(
//                             backgroundColor: Colors.white,
//                             itemExtent: 30,
//                             scrollController: FixedExtentScrollController(
//                               initialItem: 0,
//                             ),
//                             children: const [
//                               Text('0'),
//                               Text('1'),
//                               Text('2'),
//                               Text('3'),
//                               Text('4'),
//                               Text('5'),
//                             ],
//                             onSelectedItemChanged: (int value) {
//                               setState(() {
//                                 _selectedAdultValue = value;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Gap(5),
//                     CupertinoButton.filled(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 6, horizontal: 6),
//                       child: Text("Children = $_selectedChildValue"),
//                       onPressed: () => showCupertinoModalPopup(
//                         context: context,
//                         builder: (_) => SizedBox(
//                           width: double.infinity,
//                           height: 250,
//                           child: CupertinoPicker(
//                             backgroundColor: Colors.white,
//                             itemExtent: 30,
//                             scrollController: FixedExtentScrollController(
//                               initialItem: 0,
//                             ),
//                             children: const [
//                               Text('0'),
//                               Text('1'),
//                               Text('2'),
//                               Text('3'),
//                               Text('4'),
//                               Text('5'),
//                             ],
//                             onSelectedItemChanged: (int value1) {
//                               setState(() {
//                                 _selectedChildValue = value1;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           const Gap(15),
//           Container(
//             child: ElevatedButton(
//               onPressed: () {
//                 updateSelectedOptions();
                
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ListFlightScreen(
//                       selectedOptions: selectedOptions,
//                     ),
//                   ),
//                 );
//                 updateFlightList();
//               },
//               child: Container(
//                 child: Text("Find Ticket"),
//               ),
//             ),
//           ),
//           const Gap(10),
//           Text(selectedOptions, style: Styles.textstyle),
//         ],
//       ),
//     );
//   }


// void updateFlightList() {
//     // Only update the flight list if both departure and arrival countries are selected
//     if (selectedCity1.isNotEmpty && selectedCity2.isNotEmpty) {

//       // Trigger a rebuild to reflect the updated list
//       setState(() {
//           flights = getFlights(selectedCity1, selectedCity2);
//           print("Updating flights with departure: $selectedCity1, arrival: $selectedCity2");

//       });
//     }
//   }
// // void updateFlightList() {
// //     // Only update the flight list if either departure or arrival countries change
   
// //       flights = getFlights(countryCode, countryCode1);

// //       // Update previous values
// //       previousDepartureCountry = countryCode;
// //       previousArrivalCountry = countryCode1;

// //       // Trigger a rebuild to reflect the updated list
// //       setState(() {});
    
// //   }

//   List<FlightModel> getFlights(String departureCountry, String arrivalCountry) {
//     // Filter flights based on selected departure and arrival countries
//     print("equal cha ki chaina check gareko");
//     return flights.where((flight) =>
//         flight.d_country == departureCountry && flight.a_country == arrivalCountry).toList();
//   }
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     print("didchangedependencies called");
//     // Call updateFlightList when the route changes
//     updateFlightList();
//   }
  
//   void didPopNext() {
//     print("didPopNext called");
//     // Call updateFlightList when the route is popped (user navigates back)
//     updateFlightList();
//   }

// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:yatra1/screens/list_flight_screen.dart';
import 'package:yatra1/utilis/applayout.dart';
import 'package:yatra1/utilis/app_styles.dart';
import 'package:yatra1/utilis/dummy_data.dart';
import 'package:yatra1/utilis/flight_model.dart';
import 'package:csc_picker/csc_picker.dart';


class OneWayTicket extends StatefulWidget {
  const OneWayTicket({Key? key}) : super(key: key);

  @override
  State<OneWayTicket> createState() => _OneWayTicketState();
}
 List<Map<String,dynamic>> _allUsers = [
    {"id":1, "name":"Kathmandu"},
    {"id":2, "name":"Pokhara"},
    {"id":3, "name":"Surkhet"},
    {"id":4, "name":"Bhadrapur"},
    {"id":5, "name":"Biratnagar"},
    {"id":6, "name":"Illam"},
    {"id":7, "name":"Chitwan"},
    {"id":8, "name":"Mustang"},
  ];
  //List<FlightModel> flights = []; 
  String selectedCity1 = '';
  String selectedCity2 = '';
class _OneWayTicketState extends State<OneWayTicket> {
  DateTime _departureDate = DateTime.now();
  bool _isDepartureDateSelected = true;
  int _selectedAdultValue = 0;
  int _selectedChildValue = 0;
  String countryCode = "";
  String countryCode1 = "";
  String selectedOptions = "";
  late String d_country;
  late String a_country;
  
  String get userEmailAddress => '';


  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024, 1, 10),
    ).then((value) {
      if (value != null) {
        setState(() {
          if (_isDepartureDateSelected) {
            _departureDate = value;
          } else {}
        });
      }
    });
  }

Future<void> sendFlightDetailsEmail(
  String recipientEmail,
  String departureCountry,
  String arrivalCountry,
  DateTime departureDate,
  int adults,
  int children,
  String paymentReference,
) async {
 final smtpServer = gmail('pujakadayat1@gmail.com', 'zire chgc uvih tndh');// Replace with your email credentials

  // Create the email message
  final message = Message()
    ..from = Address('yatra@gmail.com', 'Yatra')
    ..recipients.add(recipientEmail)
    ..subject = 'Flight Details'
    ..text = 'Your flight details:\n\n'
        'From: $departureCountry\n'
        'To: $arrivalCountry\n'
        'Departure Date: ${DateFormat('yyyy-MM-dd').format(departureDate)}\n'
        'Adults: $adults\n'
        'Children: $children\n\n'
        'Payment Reference: $paymentReference\n'
        'Thank you for booking your flight with us!';

  try {
    // Send the email
    final sendReport = await send(message, smtpServer);

    print('Flight details email sent: ' + sendReport.toString());
  } catch (e) {
    print('Error sending flight details email: $e');
  }
}


  Future<void> bookFlight(String paymentReference) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String? userEmail = user?.email;

      if (userEmail != null) {
        // Store flight booking information in Cloud Firestore
        DocumentReference bookingReference = await FirebaseFirestore.instance.collection('flight_bookings').add({
          'userEmail': userEmail,
          'departureCity': selectedCity1,
          'arrivalCity': selectedCity2,
          'departureDate': _departureDate,
          'adults': _selectedAdultValue,
          'children': _selectedChildValue,
          'paymentReference': paymentReference,
        });

        // Send flight booking confirmation email
        await sendFlightBookingConfirmationEmail(
          userEmail,
          selectedCity1,
          selectedCity2,
          _departureDate,
          _selectedAdultValue,
          _selectedChildValue,
          paymentReference,
        );

        print('Flight booking successful!');
        // Consider showing a confirmation message or navigating to another screen.

        // Optionally, you can get the booking ID from Firestore and use it as needed
        String bookingId = bookingReference.id;
        print('Booking ID: $bookingId');
      } else {
        print('User not logged in or email is null.');
      }
    } catch (e) {
      print('Error booking flight: $e');
    }
  }

  Future<void> sendFlightBookingConfirmationEmail(
    String recipientEmail,
    String departureCountry,
    String arrivalCountry,
    DateTime departureDate,
    int adults,
    int children,
    String paymentReference,
  ) async {
    final smtpServer = gmail('pujakadayat1@gmail.com', 'zire chgc uvih tndh');

    // Create the email message
    final message = Message()
      ..from = Address('yatra@gmail.com', 'Yatra')
      ..recipients.add(recipientEmail)
      ..subject = 'Flight Booking Confirmation'
      ..text = 'Thank you for booking your flight with us!\n\n'
          'From: $departureCountry\n'
          'To: $arrivalCountry\n'
          'Departure Date: ${DateFormat('yyyy-MM-dd').format(departureDate)}\n'
          'Adults: $adults\n'
          'Children: $children\n\n'
          'Your flight booking is confirmed.\n'
          'Payment Reference: $paymentReference';

    try {
  // Send the email
  final sendReport = await send(message, smtpServer);
  print('Flight booking confirmation email sent: ' + sendReport.toString());
} catch (e) {
  print('Error sending flight booking confirmation email: $e');
}
  }
void onSuccess(PaymentSuccessModel success) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Payment Successful"),
        actions: [
          SimpleDialogOption(
            child: const Text("OK"),
            onPressed: () {
              setState(() {
                var referenceId = success.idx;
              });
              Navigator.pop(context);

              // Call the sendFlightDetailsEmail function with the payment reference code
              sendFlightDetailsEmail(
              userEmailAddress,  // Pass the user email address here
                selectedCity1,  // Pass the departure country code here
                selectedCity2,  // Pass the arrival country code here
                _departureDate,
                _selectedAdultValue,
                _selectedChildValue,
                success.idx,
              );
            },
          ),
        ],
      );
    },
  );
}

  void updateSelectedOptions() {
    setState(() {
      selectedOptions =
          "From: $selectedCity1\nTo: $selectedCity2\nDeparture Date: ${DateFormat('yyyy-MM-dd').format(_departureDate)}\nAdults: $_selectedAdultValue\nChildren: $_selectedChildValue";
    });
  }
 // Initialize an empty list
  // String previousDepartureCountry = "";
  // String previousArrivalCountry = "";
  @override
  Widget build(BuildContext context) {
      //List<FlightModel> flights = []; 
    final size = AppLayout.getSize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("One-Way-Ticket"),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Gap(40),
          Text(
            "What are\nyou looking for?",
            style: Styles.headLinestyle1.copyWith(fontSize: 35),
          ),
          const Gap(40),
          Container(
            width: size.width * 0.44,
            height: size.width * 0.07,
            padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFF4F6FD),
            ),
            child: Center(child: Text("Airlines")),
          ),
          const Gap(10),
          Container(
            width: size.width * 0.44,
            height: size.width * 0.07,
            padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFF4F6FD),
            ),
            child: Center(child: Text("One-Way-Tickets")),
          ),
          const Gap(10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.flight_takeoff_rounded, color: Color(0xFFBFC2DF)),
                    TextButton(
  onPressed: () {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200, // Set the desired height
          child: ListView.builder(
            itemCount: _allUsers.length,
            itemBuilder: (BuildContext context, int index) {
              final user = _allUsers[index];
              return ListTile(
                title: Text(user['name']),
                onTap: () {
                  // Handle selection of the city (user['name'])
                  print('Selected city: ${user['name']}');
                  setState(() {
                    selectedCity1 = user['name']; // Assuming you have a variable named selectedCity
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  },
  child: Text(selectedCity1.isNotEmpty ? selectedCity1 : "Select City"),
),
                    const Gap(100),
                    Icon(Icons.flight_land_rounded, color: Color(0xFFBFC2DF)),
                     TextButton(
  onPressed: () {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200, // Set the desired height
          child: ListView.builder(
            itemCount: _allUsers.length,
            itemBuilder: (BuildContext context, int index) {
              final user = _allUsers[index];
              return ListTile(
                title: Text(user['name']),
                onTap: () {
                  // Handle selection of the city (user['name'])
                  print('Selected city: ${user['name']}');
                  setState(() {
                    selectedCity2 = user['name']; // Assuming you have a variable named selectedCity
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  },
  child: Text(selectedCity2.isNotEmpty ? selectedCity2 : "Select City"),
),
                  ],
                ),
              ],
            ),
          ),
          const Gap(10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Icon(Icons.flight_takeoff_rounded, color: Color(0xFFBFC2DF)),
                const Gap(10),
                Text("Departure", style: Styles.textstyle),
                const Gap(30),
                Row(
                  children: [
                    Text(DateFormat('yyyy-MM-dd').format(_departureDate)),
                    const Gap(17),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _isDepartureDateSelected = true;
                        });
                        _showDatePicker();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text("Choose date"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Gap(10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Icon(Icons.people_alt_rounded, color: Color(0xFFBFC2DF)),
                const Gap(10),
                Text("No. of people", style: Styles.textstyle),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton.filled(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                      child: Text("Adult = $_selectedAdultValue"),
                      onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (_) => SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 30,
                            scrollController: FixedExtentScrollController(
                              initialItem: 0,
                            ),
                            children: const [
                              Text('0'),
                              Text('1'),
                              Text('2'),
                              Text('3'),
                              Text('4'),
                              Text('5'),
                            ],
                            onSelectedItemChanged: (int value) {
                              setState(() {
                                _selectedAdultValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const Gap(5),
                    CupertinoButton.filled(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                      child: Text("Children = $_selectedChildValue"),
                      onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (_) => SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 30,
                            scrollController: FixedExtentScrollController(
                              initialItem: 0,
                            ),
                            children: const [
                              Text('0'),
                              Text('1'),
                              Text('2'),
                              Text('3'),
                              Text('4'),
                              Text('5'),
                            ],
                            onSelectedItemChanged: (int value1) {
                              setState(() {
                                _selectedChildValue = value1;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Gap(15),
          Container(
            // child: ElevatedButton(
            //   onPressed: () {
            //     updateSelectedOptions();
                
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ListFlightScreen(
            //           selectedOptions: selectedOptions,
            //         ),
            //       ),
            //     );
            //     updateFlightList();
            //   },
            //   child: Container(
            //     child: Text("Find Ticket"),
            //   ),
            // ),
            child: ElevatedButton(
  onPressed: () {
    //updateSelectedOptions();
    // updateFlightList(selectedCity1, selectedCity2);
    // Check if both departure and arrival cities are selected
    if (selectedCity1.isNotEmpty && selectedCity2.isNotEmpty) {
      setState(() {
        updateFlightList(selectedCity1, selectedCity2);
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListFlightScreen(
            selectedOptions: selectedOptions,
          ),
        ),
      );
    } else {
      print("EMPTY CITIES");// Show a message or handle the case where either departure or arrival city is not selected
    }
  },
  child: Container(
    child: Text("Find Ticket"),
  ),
),
          ),
          const Gap(10),
          Text(selectedOptions, style: Styles.textstyle),
        ],
      ),
    );
  }


// void updateFlightList(String selectedCity1, String selectedCity2) {
//     // Only update the flight list if both departure and arrival countries are selected
//     // if (selectedCity1.isNotEmpty && selectedCity2.isNotEmpty) {

//       // Trigger a rebuild to reflect the updated list
//       setState(() {
//           flights = getFlights(selectedCity1, selectedCity2);
//           print("Updating flights with departure: $selectedCity1, arrival: $selectedCity2");

//       });
//     //}
//   }

// void updateFlightList(String selectedCity1, String selectedCity2) {
//   if (selectedCity1.isNotEmpty && selectedCity2.isNotEmpty) {
//     flights = getFlights(selectedCity1, selectedCity2);
//     print("Updating flights with departure: $selectedCity1, arrival: $selectedCity2");
//   }
// }
void updateFlightList(String selectedCity1, String selectedCity2) {
  print("I am called");
  //flights = [];
  // Only update the flight list if both departure and arrival cities are selected
  if (selectedCity1.isNotEmpty && selectedCity2.isNotEmpty) {
    print("Updating flights with departure: $selectedCity1, arrival: $selectedCity2");
    flights = getFlights(selectedCity1, selectedCity2);
    print("Updated flights: $flights");
  } else {
    print("EMPTY CITIES");
  }
}



  List<FlightModel> getFlights(String selectedcity1, String selectedCity2) {
    // Filter flights based on selected departure and arrival countries
    print("getFlights function called");
    print("Departure City: $selectedcity1, Arrival City: $selectedCity2");
    return flights.where((flight) =>
        flight.d_country == selectedcity1 && flight.a_country == selectedCity2).toList();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didchangedependencies called");
    // Call updateFlightList when the route changes
    //updateFlightList();
  }
  
  void didPopNext() {
    print("didPopNext called");
    // Call updateFlightList when the route is popped (user navigates back)
    //updateFlightList();
  }

}

  // List<FlightModel> getFlights(d_country, a_country) {
  //   // Replace this with your actual logic to fetch flights from your data source
  //   // For simplicity, a hardcoded list is used in this example
  //   return [
  //     FlightModel(
  //   id: "Rs. 10000", 
  //   name: "Yeti Airlines", 
  //   price: "1000/-",
  //   d_country: "Kathmandu",
  //   a_country: "Pokhara"
  //   ),
  //   FlightModel(
  //   id: "Rs. 20000", 
  //   name: "Buddha Air", 
  //   price: "2000/-",
  //   d_country: "Nepal",
  //   a_country: "Australia"
  //   ),
  //     // Add more flights as needed
  //   ];
  // }