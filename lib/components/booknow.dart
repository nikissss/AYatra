// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<void> bookNow(String userName, String userEmail) async {
//   try {
//     await FirebaseFirestore.instance.collection('bookings').add({
//       'userName': userName,
//       'userEmail': userEmail,
//       // Add other relevant data
//     });
//     print('Booking successful!');
//   } catch (e) {
//     print('Error booking: $e');
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> bookNow(String userName) async {
  try {
    // Get the current user's email from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;
    String? userEmail = user?.email;

    if (userEmail != null) {
      // Store the booking information in Cloud Firestore
      await FirebaseFirestore.instance.collection('bookings').add({
        'userName': userName,
        'userEmail': userEmail,
        // Add other relevant data
      });

      print('Booking successful!');
    } else {
      print('User not logged in or email is null.');
    }
  } catch (e) {
    print('Error booking: $e');
  }
}

