
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yatra1/Dashboard/AddHotel.dart';
import 'package:yatra1/Dashboard/mobilescreen.dart';

// class DrawerMobile extends StatelessWidget {
//   const DrawerMobile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       decoration: BoxDecoration(color: Colors.white, boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(.2),
//           blurRadius: 2,
//           offset: const Offset(0.5, 0.0),
//           spreadRadius: 2,
//         ),
//       ]),
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 10,
//           ),
//           SizedBox(
//             width: 80,
//             height: 80,
//             child: Image.asset("assets/logo.png"),
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   " Hey Prashanna!",
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const Divider(
//             thickness: 0.50,
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           //_singleButton(icon: Icons.widgets, title: 'Main'),
//           _singleButton(
//             icon: Icons.widgets,
//             title: "Main",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MobileScreen()),
//               );
//             },
//           ),

//           const Divider(
//             thickness: 0.50,
//           ),
//           _singleButton(
//             icon: Icons.add_a_photo,
//             title: "Add your hotel",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const AddHotel()),
//               );
//             },
//           ),
//           const Divider(
//             thickness: 0.50,
//           ),
//           _singleButton(icon: Icons.settings, title: "Settings"),
//           const Divider(
//             thickness: 0.50,
//           ),
//           _singleButton(icon: Icons.exit_to_app, title: "Exit"),
//         ],
//       ),
//     );
//   }

//   Widget _singleButton(
//       {required IconData icon, required String title, Function()? onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8),
//         child: Row(
//           children: [Icon(icon), Text(title)],
//         ),
//       ),
//     );
//   }
// }


class DrawerMobile extends StatelessWidget {
final User? user;

const DrawerMobile({Key? key, required this.user}) : super(key: key);

@override
Widget build(BuildContext context) {
User? currentUser = FirebaseAuth.instance.currentUser;
return Container(
width: 300,
decoration: BoxDecoration(
color: Colors.white,
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(.2),
blurRadius: 2,
offset: const Offset(0.5, 0.0),
spreadRadius: 2,
),
],
),
child: Column(
children: [
const SizedBox(
height: 10,
),
SizedBox(
width: 80,
height: 80,
// child: Image.asset("assets/logo.png"),
),
Container(
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
" Hey ${currentUser?.displayName ??''}!",
style: TextStyle(fontSize: 18),
),
],
),
),
const SizedBox(
height: 20,
),
const Divider(
thickness: 0.50,
),
const SizedBox(
height: 20,
),
//_singleButton(icon: Icons.widgets, title: 'Main'),
_singleButton(
icon: Icons.widgets,
title: "Main",
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => MobileScreen(user: currentUser),
),
);
},
),
const Divider(
thickness: 0.50,
),
_singleButton(
icon: Icons.add_a_photo,
title: "Add your hotel",
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => AddHotel(),
),
);
},
),
const Divider(
thickness: 0.50,
),
_singleButton(icon: Icons.settings, title: "Settings"),
const Divider(
thickness: 0.50,
),

],
),
);
}

Widget _singleButton({
required IconData icon,
required String title,
Function()? onTap,
}) {
return GestureDetector(
onTap: onTap,
child: Container(
margin: const EdgeInsets.symmetric(horizontal: 8),
child: Row(
children: [
Icon(icon),
Text(title),
],
),
),
);
}
}


