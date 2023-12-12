// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthService {
//   // Google sign in
//   signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? gUser = await GoogleSignIn().signIn(); // Use signIn

//       if (gUser == null) {
//         // The user canceled the sign-in process
//         return null;
//       }

//       // Obtain auth details from request
//       final GoogleSignInAuthentication gAuth = await gUser.authentication;

//       // Obtain a new credential for the user
//       final credential = GoogleAuthProvider.credential(
//         accessToken: gAuth.accessToken,
//         idToken: gAuth.idToken,
//       );

//       // Finally, let's sign in
//       return await FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (error) {
//       print("Error signing in with Google: $error");
//       return null;
//     }
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in process
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      return user;
    } catch (error) {
      print("Error signing in with Google: $error");
      return null;
    }
  }
}
