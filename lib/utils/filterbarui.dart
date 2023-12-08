

// import 'package:flutter/material.dart';
// import 'package:yatra1/appLocalization.dart';
// import 'package:yatra1/hoteldetail/routename.dart';
// // import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
// import 'package:yatra1/utils/text_styles.dart';
// import 'package:yatra1/utils/themes.dart';

// class FilterBarUI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppTheme.scaffoldBackgroundColor,
//       child: Stack(
//         children: <Widget>[
//           Padding(
//             padding:
//                 const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
//             child: Row(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "530",
//                     style: TextStyles(context).getRegularStyle(),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 0.0),
//                     child: Text(
//                       AppLocalizations(context).of("hotel_found"),
//                       style: TextStyles(context).getRegularStyle(),
//                     ),
//                   ),
//                 ),
//                 Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(4.0),
//                     ),
//                     onTap: () {
//                       NavigationServices(context).gotoFiltersScreen();
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 8),
//                       child: Row(
//                         children: <Widget>[
//                           Text(
//                             AppLocalizations(context).of("filtter"),
//                             style: TextStyles(context).getRegularStyle(),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Icon(Icons.sort,
//                                 color: Theme.of(context).primaryColor),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Divider(
//               height: 1,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
// import 'package:yatra1/appLocalization.dart';
import 'package:yatra1/utils/text_styles.dart';
import 'package:yatra1/utils/themes.dart';
import 'package:yatra1/hoteldetail/filterscreen/filterscreen.dart'; // Import the file where your FilterScreen is defined

class FilterBarUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.scaffoldBackgroundColor,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "530",
                    style: TextStyles(context).getRegularStyle(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text(
                      "hotel_found",
                      style: TextStyles(context).getRegularStyle(),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      _gotoFiltersScreen(context); // Navigate to filter screen
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "filtter",
                            style: TextStyles(context).getRegularStyle(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.sort, color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Divider(
              height: 1,
            ),
          )
        ],
      ),
    );
  }

  void _gotoFiltersScreen(BuildContext context) {
    // Use Navigator.push to navigate to the filter screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FiltersScreen(), // Replace with your FilterScreen class
      ),
    );
  }
}
