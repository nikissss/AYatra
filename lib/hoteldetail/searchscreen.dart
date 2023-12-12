// import 'package:flutter/material.dart';
// import 'package:yatra1/appLocalization.dart';
// import 'package:yatra1/utilis/hotellistdata.dart';
// import 'package:yatra1/hoteldetail/searchtypelist.dart';
// import 'package:yatra1/utils/themes.dart';
// import'package:yatra1/hoteldetail/searchview.dart';
// import 'package:yatra1/widgets/commonappbarview.dart';
// import 'package:yatra1/widgets/commoncard.dart';
// import 'package:yatra1/widgets/commonsearchbar.dart';
// import 'package:yatra1/widgets/removefocuse.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen>
//     with TickerProviderStateMixin {
//   List<HotelListData> lastsSearchesList = HotelListData.lastsSearchesList;

//   late AnimationController animationController;
//   final myController = TextEditingController();

//   @override
//   void initState() {
//     animationController = AnimationController(
//         duration: const Duration(milliseconds: 2000), vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.scaffoldBackgroundColor,
//       body: RemoveFocuse(
//         onClick: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             CommonAppbarView(
//               iconData: Icons.close,
//               onBackClick: () {
//                 Navigator.pop(context);
//               },
//               titleText: AppLocalizations(context).of("search_hotel"),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 24, right: 24, top: 16, bottom: 16),
//                           child: CommonCard(
//                             color: AppTheme.backgroundColor,
//                             radius: 36,
//                             child: CommonSearchBar(
//                               textEditingController: myController,
//                               iconData: FontAwesomeIcons.search,
//                               enabled: true,
//                               text: AppLocalizations(context)
//                                   .of("where_are_you_going"),
//                             ),
//                           ),
//                         ),
//                         SearchTypeListView(),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 24, right: 24, top: 8),
//                           child: Row(
//                             children: <Widget>[
//                               Expanded(
//                                 child: Text(
//                                   AppLocalizations(context).of("Last_search"),
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 16,
//                                     letterSpacing: 0.5,
//                                   ),
//                                 ),
//                               ),
//                               Material(
//                                 color: Colors.transparent,
//                                 child: InkWell(
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(4.0)),
//                                   onTap: () {
//                                     setState(() {
//                                       myController.text = '';
//                                     });
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8),
//                                     child: Row(
//                                       children: <Widget>[
//                                         Text(
//                                           AppLocalizations(context)
//                                               .of("clear_all"),
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 14,
//                                             color:
//                                                 Theme.of(context).primaryColor,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ] +
//                       getPList(myController.text.toString()) +
//                       [
//                         SizedBox(
//                           height: MediaQuery.of(context).padding.bottom + 16,
//                         )
//                       ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<Widget> getPList(String serachValue) {
//     List<Widget> noList = [];
//     var cout = 0;
//     final columCount = 2;
//     List<HotelListData> custList = lastsSearchesList
//         .where((element) =>
//             element.titleTxt.toLowerCase().contains(serachValue.toLowerCase()))
//         .toList();
//     print(custList.length);
//     for (var i = 0; i < custList.length / columCount; i++) {
//       List<Widget> listUI = [];
//       for (var i = 0; i < columCount; i++) {
//         try {
//           final date = custList[cout];
//           var animation = Tween(begin: 0.0, end: 1.0).animate(
//             CurvedAnimation(
//               parent: animationController,
//               curve: Interval((1 / custList.length) * cout, 1.0,
//                   curve: Curves.fastOutSlowIn),
//             ),
//           );
//           animationController.forward();
//           listUI.add(Expanded(
//             child: SerchView(
//               hotelInfo: date,
//               animation: animation,
//               animationController: animationController,
//             ),
//           ));
//           cout += 1;
//         } catch (e) {}
//       }
//       noList.add(
//         Padding(
//           padding: const EdgeInsets.only(left: 16, right: 16),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             children: listUI,
//           ),
//         ),
//       );
//     }
//     return noList;
//   }
// }

import 'package:flutter/material.dart';
import 'package:yatra1/hoteldetail/searchview.dart';
import 'package:yatra1/utilis/hotellistdata.dart';
import 'package:yatra1/hoteldetail/searchtypelist.dart';
import 'package:yatra1/utils/themes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yatra1/widgets/commoncard.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  List<HotelListData> lastsSearchesList = HotelListData.lastsSearchesList;

  late AnimationController animationController;
  final myController = TextEditingController();

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text("Search Hotel"),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
                      child: CommonCard(
                        color: AppTheme.backgroundColor,
                        radius: 36,
                        child: TextFormField(
                          controller: myController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.search),
                            enabled: true,
                            labelText: "Where are you going",
                          ),
                        ),
                      ),
                    ),
                    SearchTypeListView(),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Last Search",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(4.0)),
                              onTap: () {
                                setState(() {
                                  myController.text = '';
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Clear All",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ] +
                      getPList(myController.text.toString()) +
                      [
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 16,
                        )
                      ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getPList(String serachValue) {
    List<Widget> noList = [];
    var cout = 0;
    final columCount = 2;
    List<HotelListData> custList = lastsSearchesList
        .where((element) =>
            element.titleTxt.toLowerCase().contains(serachValue.toLowerCase()))
        .toList();
    print(custList.length);
    for (var i = 0; i < custList.length / columCount; i++) {
      List<Widget> listUI = [];
      for (var i = 0; i < columCount; i++) {
        try {
          final date = custList[cout];
          var animation = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animationController,
              curve: Interval((1 / custList.length) * cout, 1.0,
                  curve: Curves.fastOutSlowIn),
            ),
          );
          animationController.forward();
          listUI.add(Expanded(
            child: SerchView(
              hotelInfo: date,
              animation: animation,
              animationController: animationController,
            ),
          ));
          cout += 1;
        } catch (e) {}
      }
      noList.add(
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: listUI,
          ),
        ),
      );
    }
    return noList;
  }
  
  SerchView({required HotelListData hotelInfo, required Animation<double> animation, required AnimationController animationController}) {}
}
