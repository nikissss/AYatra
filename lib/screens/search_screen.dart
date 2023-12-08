// import 'package:flutter/material.dart';
// import 'package:yatra1/utilis/appinfo_list.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin {

// List<hotelList> lastSearchList  = hotelList.lastSearchList;

// late AnimationController animationController;
// final myController =  TextEditingController();
//  RemoveFocus() {
//     // Implementation of RemoveFocus method
//   }

//   CommonAppBarView({required IconData iconData, required Null Function() onBackClick}) {
//     // Implementation of CommonAppBarView method
//   }


// @override 
// void initState(){
//   //ToDO : implement initstate
//   animationController = AnimationController(
//     vsync: this, duration: Duration(milliseconds: 2000));
//     super.initState();
// }

// @override
//   void dispose() {
//     // TODO: implement dispose
//    animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: RemoveFocus(
// onClick: (){
//   FocusScope.of(context).requestFocus(FocusNode());
// },
// child:Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//    CommonAppBarView(
//   iconData: Icons.close_rounded,
//   onBackClick: () {
//     Navigator.pop(context);
//   },
//   titleText: AppLocalization(context).of('search_hotel'),
// ),

//       Expanded(
//         child: SingleChildScrollView(
//           child:Column(
//             Padding(padding: EdgeInsets.only(
//               left:24, right:24 , top:16, bottom:16 ),
//               child:CommonCard(
//                 color:Colors.grey[500],
//                 radius:36,
//                 child:CommonSearch
//               )
//               )
//           )
//         )
//         )
//     )
//   ],
// ),

//       ),
//     );
//   }
// }