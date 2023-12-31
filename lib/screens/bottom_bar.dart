

// // import 'package:fluentui_icons/fluentui_icons.dart';
// // import 'package:flutter/material.dart';
// // import 'package:yatra1/screens/homescreen.dart';
// // import 'package:yatra1/screens/hotelbookscreen.dart';

// // class BottomBar extends StatefulWidget {
// //   const BottomBar({Key? key}) : super(key: key);

// //   @override
// //   State<BottomBar> createState() => _BottomBarState();
// // }
// // int _selectedIndex=0;

// // class _BottomBarState extends State<BottomBar> {

// //   static final List<Widget>_widgetOptions =  <Widget>[
// // HomeScreen(),//homescreen class call gareko
// // const HotelHomeScreen(),

// // // const Text("Search"),
// // const Text("Tickets"),
// // const Text("Profile"),
// //   ];
 
// //  //yesle jun icon ma click garyo teslai open garxa
// //   void _onItemTapped(int index){
// // setState(() {
// //   _selectedIndex=index;
// // });

// //   }


// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
    
// //       body:Center(
// //         child: _widgetOptions[_selectedIndex],
// //         ),
// //       bottomNavigationBar:BottomNavigationBar(
// //         currentIndex: _selectedIndex,
// //         onTap:_onItemTapped, //onitem tapped method call gareko
        
// //         elevation:10,
// //         showSelectedLabels: false,
// //         showUnselectedLabels: false,
// //         selectedItemColor: Colors.blueGrey,
// //         type:BottomNavigationBarType.fixed,
// //         unselectedItemColor: const Color(0xFF526480),
// //         items:const [
// //           BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
// //           activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
// //           label: "Home"),
// //            BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
// //            activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
// //            label: "Search"),
// //             BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
// //             activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
// //             label: "Ticket"),
// //              BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
// //                          activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
// //              label: "Profile"),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:fluentui_icons/fluentui_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:yatra1/screens/search_screen.dart';
// // import 'package:my_project/screens/home_screen.dart';
// // import 'package:my_project/screens/profile_screen.dart';
// // import 'package:my_project/screens/search_screen.dart';
// // import 'package:my_project/screens/ticket_screen.dart';

// import 'package:yatra1/screens/homescreen.dart';
// import 'package:yatra1/screens/hotelbookscreen.dart';
// import 'package:yatra1/screens/one_way_ticket.dart';

// class BottomBar extends StatefulWidget {
//   const BottomBar({Key? key}): super(key:key);

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }
// int _selectedIndex=0;
// class _BottomBarState extends State<BottomBar> {
//   static final List<Widget>_widgetOptions=<Widget>
//   [
//      HomeScreen(),
//     SearchScreen(),
//    HotelHomeScreen(),
//     OneWayTicket()
//   ];


//   void _onItemTapped(int index){
//     setState(() {
//       print("$_selectedIndex");
//       _selectedIndex = index;
//     });
//     switch (index) {
//       case 0:
//         // Navigate to the HomeScreen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScreen()),
//         );
//         break;
//       case 1:
//         // Navigate to the HotelHomeScreen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => SearchScreen()),
//         );
//         break;
//          case 2:
//         // Navigate to the HotelHomeScreen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HotelHomeScreen()),
//         );
//         break;
//          case 3:
//         // Navigate to the HotelHomeScreen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => OneWayTicket()),
//         );
//         break;
//       // Add cases for other items as needed
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text("My tickets"),
//       // ),
//       body:Center(
//         child: _widgetOptions[_selectedIndex]
//         ),
//     bottomNavigationBar: BottomNavigationBar(
//       currentIndex: _selectedIndex,
//       onTap: _onItemTapped,
//       elevation: 10,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       selectedItemColor: Colors.blueGrey,
//       type: BottomNavigationBarType.fixed,
//       unselectedItemColor: Color.fromARGB(245, 38, 57, 94),
//       items: const [
//         BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
//         activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
//         label: "Home",
//         ),
//         BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_airplane_regular),
//         activeIcon: Icon(FluentSystemIcons.ic_fluent_airplane_filled),
//         label: "Search"),
//         BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_building_regular),
//         activeIcon: Icon(FluentSystemIcons.ic_fluent_building_filled),
//         label: "Tickets"),
//         BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
//         activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
//         label: "Profile")
//       ],
//     ),
//     );
//   }
// }
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:yatra1/Profile/profile_screen.dart';
import 'package:yatra1/screens/search_screen.dart';
import 'package:yatra1/mytrips/mytrips.dart';
import 'package:yatra1/screens/homescreen.dart';
import 'package:yatra1/screens/hotelbookscreen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}


class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  late AnimationController animationController;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

//   void _onItemTapped(int index) {
//   print("Item tapped: $index");
//   setState(() {
//     _selectedIndex = index;
//   });
// }

void _onItemTapped(int index) {
  print("Item tapped: $index");
  if (index == 1) { // Check if the "Search" tab is tapped
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HotelHomeScreen()),
    );
  }
  if (index == 2) { // Check if the "Search" tab is tapped
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchScreen()),
    );
  }
  // if (index == 3) { // Check if the "Search" tab is tapped
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => MyTripsScreen(animationController: animationController,)),
  //   );
  // }
  if (index == 3) { // Check if the "Search" tab is tapped
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen(animationController: animationController,)),
    );
  } 
  else {
    setState(() {
      _selectedIndex = index;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomeScreen(),
      HotelHomeScreen(), // Use HotelHomeScreen for the "Search" tab
      // Add your other pages here
      // TicketsPage(),
      // ProfilePage(),
      SearchScreen(),
     // MyTripsScreen(animationController: animationController),
      ProfileScreen(animationController: animationController),
    ];

//     return Scaffold(
//       body: _widgetOptions[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
//             activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
//             activeIcon: Icon(FluentSystemIcons.ic_fluent_search_regular),
//             label: "Search",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
//             activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
//             label: "Ticket",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
//             activeIcon: Icon(FluentSystemIcons.ic_fluent_person_regular),
//             label: "Profile",
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         unselectedItemColor: Colors.blueGrey,
//         selectedItemColor: Colors.blueGrey,
//       ),
//     );
//   }
// }



    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_building_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_building_filled),
            label: "Hotels",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_airplane_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_airplane_filled),
            label: "Flights",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(FluentSystemIcons.ic_fluent_heart_regular),
          //   activeIcon: Icon(FluentSystemIcons.ic_fluent_heart_filled),
          //   label: "My Trips",
          // ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.blueGrey,
      ),
    );
  }
}