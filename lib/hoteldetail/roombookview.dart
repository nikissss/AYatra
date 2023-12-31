
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:yatra1/appLocalization.dart';
// // import 'package:yatra1/screens/payment.dart';
// // import 'package:yatra1/utilis/hotellistdata.dart';
// // import 'package:yatra1/utils/helper.dart';
// // import 'package:yatra1/utils/text_styles.dart';
// // import 'package:yatra1/widgets/commonbutton.dart';
// // import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:yatra1/components/image_paths.dart' ;
// // import 'package:mailer/mailer.dart';
// // import 'package:mailer/smtp_server.dart';


// // class RoomBookView extends StatefulWidget {
// //   final HotelListData roomData;
// //   final AnimationController animationController;
// //   final Animation<double> animation;

// //   const RoomBookView({
// //     Key? key,
// //     required this.roomData,
// //     required this.animationController,
// //     required this.animation,
// //   }) : super(key: key);

// //   @override
// //   _RoomBookViewState createState() => _RoomBookViewState();
// // }

// // class _RoomBookViewState extends State<RoomBookView> {
// //   var pageController = PageController(initialPage: 0);

// // Future<void> bookNow(HotelListData roomData) async {
// //   try {
// //     // Get the current user's email from Firebase Authentication
// //     User? user = FirebaseAuth.instance.currentUser;
// //     String? userEmail = user?.email;

// //     if (userEmail != null) {
// //       // Storing the booking information in Cloud Firestore
// //       DocumentReference bookingReference = await FirebaseFirestore.instance.collection('bookings').add({
// //         'userEmail': userEmail,
// //         'hotelName': roomData.titleTxt,
// //         'roomDetails': roomData.roomData?.numberOfRooms, // Assuming roomData is an instance of RoomData
// //         'numberOfPeople': roomData.roomData?.numberOfPeople, // Assuming roomData is an instance of RoomData
        
// //       });

// //       // Sending booking confirmation email
// //       await sendBookingConfirmationEmail(userEmail, roomData.titleTxt, roomData.roomData);

// //       print('Booking successful!');
// //       // Consider showing a confirmation message or navigating to another screen.

// //       // Optionally, we can get the booking ID from Firestore and use it as needed
// //       String bookingId = bookingReference.id;
// //       print('Booking ID: $bookingId');
// //     } else {
// //       print('User not logged in or email is null.');
// //     }
// //   } catch (e) {
// //     print('Error booking: $e');
// //   }
// // }


// // Future<void> sendBookingConfirmationEmail(String recipientEmail, String hotelName, RoomData? roomData) async {
// //   final smtpServer = gmail('pujakadayat1@gmail.com', 'zire chgc uvih tndh ');

// //   // Create the email message
// //   final message = Message()
// //     ..from = Address('yatra@gmail.com', 'Yatra')
// //     ..recipients.add(recipientEmail)
// //     ..subject = 'Booking Confirmation'
// //     ..text = 'Thank you for booking with us!\n\n'
// //               'Hotel: $hotelName\n'
// //               'Room Details: ${roomData?.numberOfRooms} room(s)\n' // Assuming roomData is an instance of RoomData
// //               'Number of People: ${roomData?.numberOfPeople}\n\n' // Assuming roomData is an instance of RoomData
// //               'Your booking is confirmed.';

// //   try {
// //     // Send the email
// //     final sendReport = await send(message, smtpServer);

// //     print('Message sent: ' + sendReport.toString());
// //   } catch (e) {
// //     print('Error sending email: $e');
// //   }
// // }


// //   @override
// //   Widget build(BuildContext context) {
// //     List<String> images = widget.roomData.imagePath.split(" ");

// //     return AnimatedBuilder(
// //       animation: widget.animationController,
// //       builder: (BuildContext context, Widget? child) {
// //         return FadeTransition(
// //           opacity: widget.animation,
// //           child: Transform(
// //             transform: Matrix4.translationValues(
// //               0.0,
// //               40 * (1.0 - widget.animation.value),
// //               0.0,
// //             ),
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 children: <Widget>[
// //                   _buildImageSlider(images),
// //                   _buildRoomDetails(),
// //                   Divider(
// //                     height: 1,
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// // Widget _buildImageSlider(List<String> images) {
// //     return Stack(
// //       alignment: Alignment.bottomCenter,
// //       children: <Widget>[
// //         AspectRatio(
// //           aspectRatio: 1.5,
// //           child: PageView.builder(
// //             controller: pageController,
// //             itemCount: images.length,
// //             itemBuilder: (context, index) {
// //               // Use the image paths from ImagePaths class
// //               return SizedBox(
// //                 // height: 0,
// //                 child: Image.asset(
// //                   ImagePaths.room_1,
// //                   fit: BoxFit.cover,
// //                 ),
// //               );
// //             },
// //           ),
// //         ),
// //         Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: SmoothPageIndicator(
// //             controller: pageController,
// //             count: images.length,
// //             effect: WormEffect(
// //               activeDotColor: Theme.of(context).primaryColor,
// //               dotColor: Theme.of(context).backgroundColor,
// //               dotHeight: 10.0,
// //               dotWidth: 10.0,
// //               spacing: 5.0,
// //             ),
// //             onDotClicked: (index) {},
// //           ),
// //         ),
// //       ],
// //     );
// //   }


 

// //   Widget _buildRoomDetails() {
// //     return Padding(
// //       padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
// //       child: Column(
// //         children: <Widget>[
// //           _buildTitleAndBookButton(),
// //           _buildPrice(),
// //           _buildDateAndMoreDetails(),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildTitleAndBookButton() {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: <Widget>[
// //         Expanded(
// //           child: Text(
// //             widget.roomData.titleTxt,
// //             maxLines: 2,
// //             textAlign: TextAlign.left,
// //             style: TextStyles(context).getBoldStyle().copyWith(fontSize: 24),
// //             overflow: TextOverflow.ellipsis,
// //           ),
// //         ),
// //         SizedBox(
// //           height: 38,
// //           child: CommonButton(
// //             buttonTextWidget: Padding(
// //               padding: const EdgeInsets.only(
// //                   left: 16.0, right: 16.0, top: 4, bottom: 4),
// //               child: GestureDetector(
// //                 onTap: () {
// //                   // Call the bookNow function when the button is tapped
// //                   bookNow(widget.roomData);
// //                 },
// //                 // child: Text(
// //                 //   "book_now",
// //                 //   textAlign: TextAlign.center,
// //                 //   style: TextStyles(context).getRegularStyle(),
// //                 // ),
// // child:InkWell(
// // onTap: () {
// // // Add your onTap functionality here
// // Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (context) => Payment(),
// //               ),
// //             );
// // // You can navigate to a new screen, perform an action, etc.
// // },
// // child: Text(
// // "book_now",
// // textAlign: TextAlign.center,
// // style: TextStyles(context).getRegularStyle(),
// // ),
// // )
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //   Widget _buildPrice() {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.start,
// //       children: <Widget>[
// //         Text(
// //           "\$${widget.roomData.perNight}",
// //           textAlign: TextAlign.left,
// //           style: TextStyles(context).getBoldStyle().copyWith(fontSize: 22),
// //         ),
// //         Padding(
// //           padding: const EdgeInsets.only(bottom: 0),
// //           child: Text(
// //             "per_night",
// //             style: TextStyles(context).getRegularStyle().copyWith(fontSize: 14),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildDateAndMoreDetails() {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       crossAxisAlignment: CrossAxisAlignment.center,
// //       children: <Widget>[
// //         Text(
// //           Helper.getPeopleandChildren(widget.roomData.roomData!, context),
// //           textAlign: TextAlign.left,
// //           style: TextStyles(context).getDescriptionStyle(),
// //         ),
// //         InkWell(
// //           borderRadius: BorderRadius.all(Radius.circular(4.0)),
// //           onTap: () {
// //             // Handle more details tap
// //           },
// //           child: Padding(
// //             padding: const EdgeInsets.only(left: 8, right: 4),
// //             child: Row(
// //               mainAxisSize: MainAxisSize.min,
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               children: <Widget>[
// //                 Text(
// //                   "more_details",
// //                   style: TextStyles(context).getBoldStyle(),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.only(top: 2),
// //                   child: Icon(
// //                     Icons.keyboard_arrow_down,
// //                     size: 24,
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server/gmail.dart';
// import 'package:yatra1/appLocalization.dart';
// import 'package:yatra1/utilis/hotellistdata.dart';
// import 'package:yatra1/utils/helper.dart';
// import 'package:yatra1/utils/text_styles.dart';
// import 'package:yatra1/widgets/commonbutton.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:yatra1/components/image_paths.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';

// class RoomBookView extends StatefulWidget {
//   final HotelListData roomData;
//   final AnimationController animationController;
//   final Animation<double> animation;

//   const RoomBookView({
//     Key? key,
//     required this.roomData,
//     required this.animationController,
//     required this.animation,
//   }) : super(key: key);

//   @override
//   _RoomBookViewState createState() => _RoomBookViewState();
// }

// class _RoomBookViewState extends State<RoomBookView> {
//   var pageController = PageController(initialPage: 0);

//   // Future<void> bookNow(HotelListData roomData, String paymentReference) async {
//   //   try {
//   //     // Get the current user's email from Firebase Authentication
//   //     User? user = FirebaseAuth.instance.currentUser;
//   //     String? userEmail = user?.email;

//   //     if (userEmail != null) {
//   //       // Storing the booking information in Cloud Firestore
//   //       DocumentReference bookingReference =
//   //           await FirebaseFirestore.instance.collection('bookings').add({
//   //         'userEmail': userEmail,
//   //         'hotelName': roomData.titleTxt,
//   //         'roomDetails': roomData.roomData?.numberOfRooms,
//   //         'numberOfPeople': roomData.roomData?.numberOfPeople,
//   //         'paymentReference': paymentReference,
//   //       });

//   //       // Sending booking confirmation email
//   //       await sendBookingConfirmationEmail(
//   //           userEmail, roomData.titleTxt, roomData.roomData, paymentReference);

//   //       print('Booking successful!');
//   //       // Consider showing a confirmation message or navigating to another screen.

//   //       // Optionally, we can get the booking ID from Firestore and use it as needed
//   //       String bookingId = bookingReference.id;
//   //       print('Booking ID: $bookingId');
//   //     } else {
//   //       print('User not logged in or email is null.');
//   //     }
//   //   } catch (e) {
//   //     print('Error booking: $e');
//   //   }
//     int selectedAdults = 0;
//   int selectedChildren = 0;
//   int selectedNumberRooms = 0;
//   DateTime startDate = DateTime.now();
//   DateTime endDate = DateTime.now();
//   // }
// Future<void> bookNow(
//     HotelListData roomData,
//      String paymentReference, int i, int selectedChildren, int selectedNumberRooms, DateTime startDate, DateTime endDate,
//     // int numberOfPeople,
//     // int numberOfChildren,
//     // int numberOfRooms,
//     // DateTime startDate,
//     // DateTime endDate,
//   ) async {
//     try {
//       // Get the current user's email from Firebase Authentication
//       User? user = FirebaseAuth.instance.currentUser;
//       String? userEmail = user?.email;
//  bookNow(
//         widget.roomData,
//         paymentReference,
//         selectedAdults + selectedChildren,
//         selectedChildren,
//         selectedNumberRooms,
//         startDate,
//         endDate,
//       );

//       if (userEmail != null) {
//         // Storing the booking information in Cloud Firestore
//         DocumentReference bookingReference =
//             await FirebaseFirestore.instance.collection('bookings').add({
//           'userEmail': userEmail,
//           'hotelName': roomData.titleTxt,
//           'roomDetails': roomData.roomData?.numberOfRooms,
//           'numberOfAdults':selectedAdults,
//           'numberOfChildren': selectedChildren,
//           'paymentReference': paymentReference,
//           'startDate': startDate.toUtc(),  // Store dates in UTC format
//           'endDate': endDate.toUtc(),
//         });

//         // Sending booking confirmation email
//         await sendBookingConfirmationEmail(
//           userEmail,
//           roomData.titleTxt,
//           roomData.roomData,
//           paymentReference,
//           selectedAdults,
//           selectedChildren,
//           selectedNumberRooms,
//           startDate,
//           endDate,
//         );

//         print('Booking successful!');
//         // Consider showing a confirmation message or navigating to another screen.

//         // Optionally, we can get the booking ID from Firestore and use it as needed
//         String bookingId = bookingReference.id;
//         print('Booking ID: $bookingId');
//       } else {
//         print('User not logged in or email is null.');
//       }
//     } catch (e) {
//       print('Error booking: $e');
//     }
//   }


//   // Future<void> sendBookingConfirmationEmail(
//   //     String recipientEmail, String hotelName, RoomData? roomData, String paymentReference) async {
//   //   final smtpServer = gmail('pujakadayat1@gmail.com', 'zire chgc uvih tndh ');

//   //   // Create the email message
//   //   final message = Message()
//   //     ..from = Address('yatra@gmail.com', 'Yatra')
//   //     ..recipients.add(recipientEmail)
//   //     ..subject = 'Booking Confirmation'
//   //     ..text = 'Thank you for booking with us!\n\n'
//   //         'Hotel: $hotelName\n'
//   //         'Room Details: ${roomData?.numberOfRooms} room(s)\n'
//   //         'Number of People: ${roomData?.numberOfPeople}\n'
//   //         'Payment Reference: $paymentReference\n\n'
//   //         'Your booking is confirmed.';

//   //   try {
//   //     // Send the email
//   //     final sendReport = await send(message, smtpServer);

//   //     print('Message sent: ' + sendReport.toString());
//   //   } catch (e) {
//   //     print('Error sending email: $e');
//   //   }
//   // }
// Future<void> sendBookingConfirmationEmail(
//     String recipientEmail,
//     String hotelName,
//     RoomData? roomData,
//     String paymentReference,
//     int numberOfPeople,
//     int numberOfChildren,
//     int numberOfRooms,
//     DateTime startDate,
//     DateTime endDate,
//   ) async {
//     final smtpServer = gmail('pujakadayat1@gmail.com', 'zire chgc uvih tndh ');

//     // Create the email message
//     final message = Message()
//       ..from = Address('yatra@gmail.com', 'Yatra')
//       ..recipients.add(recipientEmail)
//       ..subject = 'Booking Confirmation'
//       ..text = 'Thank you for booking with us!\n\n'
//           'Hotel: $hotelName\n'
//           'Room Details: ${roomData?.numberOfRooms} room(s)\n'
//           'Number of People: $numberOfPeople\n'
//           'Number of Children: $numberOfChildren\n'
//           'Payment Reference: $paymentReference\n\n'
//           'Your booking is confirmed.\n'
//           'Start Date: ${DateFormat('dd,MMM yyyy').format(startDate)}\n'
//           'End Date: ${DateFormat('dd,MMM yyyy').format(endDate)}';

//     try {
//       // Send the email
//       final sendReport = await send(message, smtpServer);

//       print('Message sent: ' + sendReport.toString());
//     } catch (e) {
//       print('Error sending email: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<String> images = widget.roomData.imagePath.split(" ");

//     return AnimatedBuilder(
//       animation: widget.animationController,
//       builder: (BuildContext context, Widget? child) {
//         return FadeTransition(
//           opacity: widget.animation,
//           child: Transform(
//             transform: Matrix4.translationValues(
//               0.0,
//               40 * (1.0 - widget.animation.value),
//               0.0,
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   _buildImageSlider(images),
//                   _buildRoomDetails(),
//                   Divider(
//                     height: 1,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildImageSlider(List<String> images) {
//     var romeList;
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: <Widget>[
//         AspectRatio(
//           aspectRatio: 1.5,
//           child: PageView.builder(
//             controller: pageController,
//             itemCount: images.length,
//             itemBuilder: (context, index) {
//               // Use the image paths from ImagePaths class
//               return SizedBox(
//                 child: Image.asset(
//                   ImagePaths.room_1,
//                   fit: BoxFit.cover,
//                 ),
//               );
//             },
//           ),
// //           child: PageView.builder(
// //   controller: pageController,
// //   itemCount: images.length,
// //   itemBuilder: (context, index) {
// //     // Get the current HotelListData
// //     HotelListData hotelData = romeList[index];

// //     // Use the image paths from the current HotelListData
// //     List<String> imagePaths = hotelData.imagePath.split(' ');

// //     // Create a list of Image Widgets from the image paths
// //     List<Widget> imageWidgets = imagePaths.map((path) {
// //       return SizedBox(
// //         child: Image.asset(
// //           path.trim(), // trim to remove any leading/trailing whitespaces
// //           fit: BoxFit.cover,
// //         ),
// //       );
// //     }).toList();

// //     // Return a stack of images using PageView for each HotelListData
// //     return PageView(
// //       controller: PageController(),
// //       children: imageWidgets,
// //     );
// //   },
// // ),



//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SmoothPageIndicator(
//             controller: pageController,
//             count: images.length,
//             effect: WormEffect(
//               activeDotColor: Theme.of(context).primaryColor,
//               dotColor: Theme.of(context).backgroundColor,
//               dotHeight: 10.0,
//               dotWidth: 10.0,
//               spacing: 5.0,
//             ),
//             onDotClicked: (index) {},
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildRoomDetails() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
//       child: Column(
//         children: <Widget>[
//           _buildTitleAndBookButton(),
//           _buildPrice(),
//           _buildDateAndMoreDetails(),
//         ],
//       ),
//     );
//   }

//   Widget _buildTitleAndBookButton() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Expanded(
//           child: Text(
//             widget.roomData.titleTxt,
//             maxLines: 2,
//             textAlign: TextAlign.left,
//             style: TextStyles(context).getBoldStyle().copyWith(fontSize: 24),
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//         SizedBox(
//           height: 38,
//           child: CommonButton(
//             buttonTextWidget: Padding(
//               padding: const EdgeInsets.only(
//                   left: 16.0, right: 16.0, top: 4, bottom: 4),
//               child: GestureDetector(
//                 onTap: () {
//                   // Call the bookNow function when the button is tapped
//                   payWithKhaltiInApp();
//                 },
//                 child: Text(
//                   "book_now",
//                   textAlign: TextAlign.center,
//                   style: TextStyles(context).getRegularStyle(),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPrice() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           "\$${widget.roomData.perNight}",
//           textAlign: TextAlign.left,
//           style: TextStyles(context).getBoldStyle().copyWith(fontSize: 22),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 0),
//           child: Text(
//             "per_night",
//             style: TextStyles(context).getRegularStyle().copyWith(fontSize: 14),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDateAndMoreDetails() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Text(
//           Helper.getPeopleandChildren(widget.roomData.roomData!, context),
//           textAlign: TextAlign.left,
//           style: TextStyles(context).getDescriptionStyle(),
//         ),
//         InkWell(
//           borderRadius: BorderRadius.all(Radius.circular(4.0)),
//           onTap: () {
//             // Handle more details tap
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(left: 8, right: 4),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "more_details",
//                   style: TextStyles(context).getBoldStyle(),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 2),
//                   child: Icon(
//                     Icons.keyboard_arrow_down,
//                     size: 24,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// //   void payWithKhaltiInApp() {
// //   KhaltiScope.of(context).pay(
// //     config: PaymentConfig(
// //       amount: 1000,
// //       productIdentity: "product id",
// //       productName: "Product name",
// //     ),
// //     preferences: [PaymentPreference.khalti],
// //     onSuccess: (PaymentSuccessModel success) async {
// //       showDialog(
// //         context: context,
// //         builder: (context) {
// //           return AlertDialog(
// //             title: Text("Payment Successful"),
// //             actions: [
// //               SimpleDialogOption(
// //                 child: const Text("OK"),
// //                 onPressed: () {
// //                   setState(() {
// //                     referenceId = success.idx;
// //                   });
// //                   Navigator.pop(context);

// //                   // Call the bookNow function with the payment reference code and additional details
// //                   bookNow(
// //                     widget.roomData,
// //                     success.idx,
// //                     selectedAdults + selectedChildren,
// //                     selectedChildren,
// //                     selectedNumberRooms,
// //                     startDate,
// //                     endDate,
// //                   );
// //                 },
// //               ),
// //             ],
// //           );
// //         },
// //       );
// //     },
// //     onFailure: onFailure,
// //     onCancel: onCancel,
// //   );
// // }
// // void payWithKhaltiInApp() {
// //   KhaltiScope.of(context).pay(
// //     config: PaymentConfig(
// //       amount: 1000,
// //       productIdentity: "product id",
// //       productName: "Product name",
// //     ),
// //     preferences: [PaymentPreference.khalti],
// //     onSuccess: (PaymentSuccessModel success) async {
// //       showDialog(
// //         context: context,
// //         builder: (context) {
// //           return AlertDialog(
// //             title: Text("Payment Successful"),
// //             actions: [
// //               SimpleDialogOption(
// //                 child: const Text("OK"),
// //                 onPressed: () {
// //                   setState(() {
// //                     var referenceId = success.idx;
// //                   });
// //                   Navigator.pop(context);

// //                   // Call the bookNow function with the payment reference code and additional details
// //                   bookNow(
// //                     widget.roomData,
// //                     success.idx,
// //                     selectedAdults + selectedChildren,
// //                     selectedChildren,
// //                     selectedNumberRooms,
// //                     startDate,
// //                     endDate,
// //                   );
// //                 },
// //               ),
// //             ],
// //           );
// //         },
// //       );
// //     },
// //     onFailure: onFailure,
// //     onCancel: onCancel,
// //   );
// // }

//   void payWithKhaltiInApp() {
//     KhaltiScope.of(context).pay(
//       config: PaymentConfig(
//         amount: 1000,
//         productIdentity: "product id",
//         productName: "Product name",
//       ),
//       preferences: [PaymentPreference.khalti],
//       onSuccess: onSuccess,
//       onFailure: onFailure,
//       onCancel: onCancel,
//     );
//   }

//   void onSuccess(PaymentSuccessModel success) async {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Payment Successful"),
//           actions: [
//             SimpleDialogOption(
//               child: const Text("OK"),
//               onPressed: () {
//                 setState(() {
//                   var referenceId = success.idx;
//                 });
//                 Navigator.pop(context);

//                 // Call the bookNow function with the payment reference code
//                 bookNow(
//                   widget.roomData,
//           success.idx,
//   selectedAdults + selectedChildren,
//   selectedChildren,
//   selectedNumberRooms,
//   startDate,
//   endDate,

//                    );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void onFailure(PaymentFailureModel failure) {
//     debugPrint(failure.toString());
//   }

//   void onCancel() {
//     debugPrint("cancelled");
//  }
//  }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:yatra1/appLocalization.dart';
import 'package:yatra1/utilis/hotellistdata.dart';
import 'package:yatra1/utils/helper.dart';
import 'package:yatra1/utils/text_styles.dart';
import 'package:yatra1/widgets/commonbutton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yatra1/components/image_paths.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class RoomBookView extends StatefulWidget {
  final HotelListData roomData;
  final AnimationController animationController;
  final Animation<double> animation;

  const RoomBookView({
    Key? key,
    required this.roomData,
    required this.animationController,
    required this.animation,
  }) : super(key: key);

  @override
  _RoomBookViewState createState() => _RoomBookViewState();
}

class _RoomBookViewState extends State<RoomBookView> {
  var pageController = PageController(initialPage: 0);

  Future<void> bookNow(HotelListData roomData, String paymentReference) async {
    try {
      // Get the current user's email from Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;
      String? userEmail = user?.email;

      if (userEmail != null) {
        // Storing the booking information in Cloud Firestore
        DocumentReference bookingReference =
            await FirebaseFirestore.instance.collection('bookings').add({
          'userEmail': userEmail,
          'hotelName': roomData.titleTxt,
          'roomDetails': roomData.roomData?.numberOfRooms,
          'numberOfPeople': roomData.roomData?.numberOfPeople,
          'paymentReference': paymentReference,
        });

        // Sending booking confirmation email
        await sendBookingConfirmationEmail(
            userEmail,
             roomData.titleTxt, roomData.roomData, paymentReference);

        print('Booking successful!');
        // Consider showing a confirmation message or navigating to another screen.

        // Optionally, we can get the booking ID from Firestore and use it as needed
        String bookingId = bookingReference.id;
        print('Booking ID: $bookingId');
      } else {
        print('User not logged in or email is null.');
      }
    } catch (e) {
      print('Error booking: $e');
    }
  }

  Future<void> sendBookingConfirmationEmail(
      String recipientEmail, String hotelName, RoomData? roomData, String paymentReference) async {
    final smtpServer = gmail('pujakadayat1@gmail.com', 'zire chgc uvih tndh');

    // Create the email message
    final message = Message()
      ..from = Address('yatra@gmail.com', 'Yatra')
      ..recipients.add(recipientEmail)
      ..subject = 'Booking Confirmation'
      ..text = 'Thank you for booking with us!\n\n'
          'Hotel: $hotelName\n'
          'Room Details: ${roomData?.numberOfRooms} room(s)\n'
          'Number of People: ${roomData?.numberOfPeople}\n'
          'Payment Reference: $paymentReference\n\n'
          'Your booking is confirmed.';

    try {
      // Send the email
      final sendReport = await send(message, smtpServer);

      print('Message sent: ' + sendReport.toString());
    } catch (e) {
      print('Error sending email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = widget.roomData.imagePath.split(" ");

    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation,
          child: Transform(
            transform: Matrix4.translationValues(
              0.0,
              40 * (1.0 - widget.animation.value),
              0.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildImageSlider(images),
                  _buildRoomDetails(),
                  Divider(
                    height: 1,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSlider(List<String> images) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.5,
          child: PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              // Use the image paths from ImagePaths class
              return SizedBox(
                child: Image.asset(
                  ImagePaths.room_1,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SmoothPageIndicator(
            controller: pageController,
            count: images.length,
            effect: WormEffect(
              activeDotColor: Theme.of(context).primaryColor,
              dotColor: Theme.of(context).backgroundColor,
              dotHeight: 10.0,
              dotWidth: 10.0,
              spacing: 5.0,
            ),
            onDotClicked: (index) {},
          ),
        ),
      ],
    );
  }

  Widget _buildRoomDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
      child: Column(
        children: <Widget>[
          _buildTitleAndBookButton(),
          _buildPrice(),
          _buildDateAndMoreDetails(),
        ],
      ),
    );
  }

  Widget _buildTitleAndBookButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            widget.roomData.titleTxt,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: TextStyles(context).getBoldStyle().copyWith(fontSize: 24),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 38,
          child: CommonButton(
            buttonTextWidget: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 4, bottom: 4),
              child: GestureDetector(
                onTap: () {
                  // Call the bookNow function when the button is tapped
                  payWithKhaltiInApp();
                },
                child: Text(
                  "book_now",
                  textAlign: TextAlign.center,
                  style: TextStyles(context).getRegularStyle(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Rs. ${widget.roomData.perNight}",
          textAlign: TextAlign.left,
          style: TextStyles(context).getBoldStyle().copyWith(fontSize: 22),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Text(
            "per_night",
            style: TextStyles(context).getRegularStyle().copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildDateAndMoreDetails() {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: <Widget>[
    //     Text(
    //       Helper.getPeopleandChildren(widget.roomData.roomData!, context),
    //       textAlign: TextAlign.left,
    //       style: TextStyles(context).getDescriptionStyle(),
    //     ),
    return   InkWell(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          onTap: () {
            // Handle more details tap
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "more_details",
                  style: TextStyles(context).getBoldStyle(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 24,
                  ),
                )
              ],
            ),
          ),
         );
    //   ],
    // );
  }

  void payWithKhaltiInApp() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: 1000,
        productIdentity: "product id",
        productName: "Product name",
      ),
      preferences: [PaymentPreference.khalti],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
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

                // Call the bookNow function with the payment reference code
                bookNow(widget.roomData, success.idx);
              },
            ),
          ],
        );
      },
    );
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(failure.toString());
  }

  void onCancel() {
    debugPrint("cancelled");
  }
}

