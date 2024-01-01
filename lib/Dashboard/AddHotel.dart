// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class AddHotel extends StatefulWidget {
//   const AddHotel({Key? key}) : super(key: key);

//   @override
//   _AddHotelState createState() => _AddHotelState();
// }

// class _AddHotelState extends State<AddHotel> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   late String _hotelName;
//   late String _description;
//   late File _imageFile =
//       File('assets/upload.png'); // Initialize with a default image path

//   Future<void> _uploadImage() async {
//     try {
//       final Reference storageRef = _storage.ref().child(
//           'hotel_images/${_hotelName}_${DateTime.now().millisecondsSinceEpoch}.jpg');
//       await storageRef.putFile(_imageFile);
//       final String downloadURL = await storageRef.getDownloadURL();
//       _saveHotelData(downloadURL);
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }

//   Future<void> _saveHotelData(String imageUrl) async {
//     try {
//       final User? user = _auth.currentUser;
//       if (user != null) {
//         await _firestore.collection('hotels').add({
//           'ownerId': user.uid,
//           'hotelName': _hotelName,
//           'description': _description,
//           'imageUrl': imageUrl,
//         });

//         Navigator.pop(context); // Go back to the previous screen after saving
//       }
//     } catch (e) {
//       print('Error saving data: $e');
//     }
//   }

//   Future<void> _getImage() async {
//     final XFile? image =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _imageFile = File(image.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Hotel'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               decoration: const InputDecoration(labelText: 'Hotel Name'),
//               onChanged: (value) => _hotelName = value,
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               decoration: const InputDecoration(labelText: 'Description'),
//               onChanged: (value) => _description = value,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _getImage,
//               child: const Text('Select Image'),
//             ),
//             const SizedBox(height: 16),
//             _imageFile != null
//                 ? Image.file(
//                     _imageFile,
//                     height: 150,
//                     width: 150,
//                     fit: BoxFit.cover,
//                   )
//                 : Container(),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _uploadImage,
//               child: const Text('Save Hotel'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class AddHotel extends StatefulWidget {
//   const AddHotel({Key? key}) : super(key: key);

//   @override
//   _AddHotelState createState() => _AddHotelState();
// }

// class _AddHotelState extends State<AddHotel> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   late String _hotelName;
//   late String _description;
//   File? _imageFile; // Nullable type

//   String? _imageUrl;

//   Future<void> _uploadImage() async {
//     try {
//     if (_imageFile != null) {
//         final Reference storageRef = _storage.ref().child(
//             'hotel_images/${_hotelName}_${DateTime.now().millisecondsSinceEpoch}.jpg');
//         await storageRef.putFile(_imageFile!);

//         final String downloadURL = await storageRef.getDownloadURL();

//         setState(() {
//           _imageUrl = downloadURL;
//         });

//         await _saveHotelData(downloadURL);
//       }
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }

//   Future<void> _saveHotelData(String imageUrl) async {
//     try {
//       final User? user = _auth.currentUser;
//       if (user != null) {
//         await _firestore.collection('hotels').add({
//           'ownerId': user.uid,
//           'hotelName': _hotelName,
//           'description': _description,
//           'imageUrl': imageUrl,
//         });
//           Navigator.pop(context); // Go back to the previous screen after saving
//       }
//     } catch (e) {
//       print('Error saving data: $e');
//     }
//   }

//   Future<void> _getImage() async {
//     final XFile? image =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _imageFile = File(image.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Hotel'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               decoration: const InputDecoration(labelText: 'Hotel Name'),
//               onChanged: (value) => _hotelName = value,

//   ),
//             const SizedBox(height: 16),
//             TextField(
//               decoration: const InputDecoration(labelText: 'Description'),
//               onChanged: (value) => _description = value,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _getImage,
//               child: const Text('Select Image'),
//             ),
//             const SizedBox(height: 16),
//             _imageFile != null
//                 ? FutureBuilder<Uint8List>(
//                     future: _imageFile!.readAsBytes(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.done &&
//                           snapshot.hasData) {
//                         return Image.memory(
//                           snapshot.data!,
//                           height: 150,
//                           width: 150,
//                           fit: BoxFit.cover,
//                         );
//                       } else {
//                         return Container();
//                       }
//                     },
//                   )
//                 : Container(),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _uploadImage,
//               child: const Text('Save Hotel'),
//             ),
//      ],
//         ),
//       ),
//     );
//   }
// }



import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class AddHotel extends StatefulWidget {
//   const AddHotel({Key? key}) : super(key: key);

//   @override
//   _AddHotelState createState() => _AddHotelState();
// }

// class _AddHotelState extends State<AddHotel> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   late String _hotelName;
//   late String _description;
//   File? _imageFile; // Nullable type

//   String? _imageUrl;

//   Future<void> _uploadImage() async {
//     try {
//       if (_imageFile != null) {
//         final Reference storageRef = _storage.ref().child(
//             'hotel_images/${_hotelName}_${DateTime.now().millisecondsSinceEpoch}.jpg');
//         await storageRef.putFile(_imageFile!);

//         final String downloadURL = await storageRef.getDownloadURL();

//         setState(() {
//           _imageUrl = downloadURL;
//         });

//         await _saveHotelData();
//       }
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }

//   Future<void> _saveHotelData() async {
//     try {
//       final User? user = _auth.currentUser;
//       if (user != null) {
//         await _firestore.collection('hotels').add({
//           'ownerId': user.uid,
//           'hotelName': _hotelName,
//           'description': _description,
//           'imageUrl': _imageUrl, // Save the image URL in Firestore
//         });

//     Navigator.pop(context, {
//   'hotelName': _hotelName,
//   'description': _description,
//   'imageUrl': _imageUrl,
// }); // Go back to the previous screen after saving
//       }
//     } catch (e) {
//       print('Error saving data: $e');
//     }
//   }

//   Future<void> _getImage() async {
//     final XFile? image =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _imageFile = File(image.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Hotel'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               decoration: const InputDecoration(labelText: 'Hotel Name'),
//               onChanged: (value) => _hotelName = value,
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               decoration: const InputDecoration(labelText: 'Description'),
//               onChanged: (value) => _description = value,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _getImage,
//               child: const Text('Select Image'),
//             ),
//             const SizedBox(height: 16),
//             _imageFile != null
//                 ? FutureBuilder<Uint8List>(
//                     future: _imageFile!.readAsBytes(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.done &&
//                           snapshot.hasData) {
//                         return Image.memory(
//                           snapshot.data!,
//                           height: 150,
//                           width: 150,
//                           fit: BoxFit.cover,
//                         );
//                       } else {
//                         return Container();
//                       }
//                     },
//                   )
//                 : Container(),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _uploadImage,
//               child: const Text('Save Hotel'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class AddHotel extends StatefulWidget {
//   const AddHotel({Key? key}) : super(key: key);

//   @override
//   _AddHotelState createState() => _AddHotelState();
// }

// class _AddHotelState extends State<AddHotel> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   late String _hotelName;
//   late String _description;
//   File? _imageFile; // Nullable type

//   String? _imageUrl;

//   Future<void> _uploadImage() async {
//     try {
//       if (_imageFile != null) {
//         final Reference storageRef = _storage.ref().child(
//             'hotel_images/${_hotelName}_${DateTime.now().millisecondsSinceEpoch}.jpg');
//         await storageRef.putFile(_imageFile!);

//         final String downloadURL = await storageRef.getDownloadURL();

//         setState(() {
//           _imageUrl = downloadURL;
//         });

//         await _saveHotelData();
//       }
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }

//   Future<void> _saveHotelData() async {
//     try {
//       final User? user = _auth.currentUser;
//       if (user != null) {
//         await _firestore.collection('hotels').add({
//           'ownerId': user.uid,
//           'hotelName': _hotelName,
//           'description': _description,
//           'imageUrl': _imageUrl, // Save the image URL in Firestore
//         });

//          Navigator.pop(context, {
//           'hotelName': _hotelName,
//           'description': _description,
//           'imageUrl': _imageUrl,
//         });// Go back to the previous screen after saving
//       }
//     } catch (e) {
//       print('Error saving data: $e');
//     }
//   }

//   Future<void> _getImage() async {
//     final XFile? image =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _imageFile = File(image.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Hotel'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               decoration: const InputDecoration(labelText: 'Hotel Name'),
//               onChanged: (value) => _hotelName = value,
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               decoration: const InputDecoration(labelText: 'Description'),
//               onChanged: (value) => _description = value,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _getImage,
//               child: const Text('Select Image'),
//             ),
//             const SizedBox(height: 16),
//             _imageFile != null
//                 ? FutureBuilder<Uint8List>(
//                     future: _imageFile!.readAsBytes(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.done &&
//                           snapshot.hasData) {
//                         return Image.memory(
//                           snapshot.data!,
//                           height: 150,
//                           width: 150,
//                           fit: BoxFit.cover,
//                         );
//                       } else {
//                         return Container();
//                       }
//                     },
//                   )
//                 : Container(),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _uploadImage,
//               child: const Text('Save Hotel'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



class AddHotel extends StatefulWidget {
  const AddHotel({Key? key}) : super(key: key);

  @override
  _AddHotelState createState() => _AddHotelState();
}

class _AddHotelState extends State<AddHotel> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  late String _hotelName;
  late String _description;
  File? _imageFile; // Nullable type

  String? _imageUrl;

  Future<void> _uploadImage() async {
    try {
      if (_imageFile != null) {
        final Reference storageRef = _storage.ref().child(
            'hotel_images/${_hotelName}_${DateTime.now().millisecondsSinceEpoch}.jpg');
        await storageRef.putFile(_imageFile!);

        final String downloadURL = await storageRef.getDownloadURL();

        setState(() {
          _imageUrl = downloadURL;
        });

        await _saveHotelData();
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> _saveHotelData() async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('hotels').add({
          'ownerId': user.uid,
          'hotelName': _hotelName,
          'description': _description,
          'imageUrl': _imageUrl,
        });

        Navigator.pop(context); // Go back to the previous screen after saving
      }
    } catch (e) {
      print('Error saving data: $e');
    }
  }

  Future<void> _getImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Hotel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Hotel Name'),
              onChanged: (value) => _hotelName = value,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Description'),
              onChanged: (value) => _description = value,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getImage,
              child: const Text('Select Image'),
            ),
            const SizedBox(height: 16),
            _imageFile != null
                ? FutureBuilder<Uint8List>(
                    future: _imageFile!.readAsBytes(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Image.memory(
                          snapshot.data!,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Container();
                      }
                    },
                  )
                : Container(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text('Save Hotel'),
            ),
          ],
        ),
      ),
    );
  }
}
