
// import 'package:yatra1/utilis/roomdata.dart';

// import 'package:flutter/material.dart';
// import 'package:yatra1/appLocalization.dart';

// // import 'package:yatra1/utilis/roomdata.dart';
// // import 'package:yatra1/utilis/roomdata.dart'; // Update the import to refer to the correct package

// import 'package:yatra1/providers/theme_provider.dart';
// import 'package:yatra1/utils/enum.dart';
// import 'package:yatra1/utils/text_styles.dart';
// import 'package:yatra1/utils/themes.dart';
// import 'package:yatra1/widgets/commonbutton.dart';
// import 'package:yatra1/widgets/commoncard.dart';
// import 'package:provider/provider.dart';




// class RoomPopupView extends StatefulWidget {
//   final Function(RoomData) onChnage;
//   final bool barrierDismissible;
//   final RoomData roomData;

//   const RoomPopupView({
//     Key? key,
//     required this.barrierDismissible,
//     required this.onChnage,
//     required this.roomData,
//   }) : super(key: key);

//   @override
//   _RoomPopupViewState createState() => _RoomPopupViewState();
// }

// class _RoomPopupViewState extends State<RoomPopupView>
//     with TickerProviderStateMixin {
//   PopupTextType popupTextType = PopupTextType.no;
//   late AnimationController animationController;

//   DateTime? startDate;
//   DateTime? endDate;
//   RoomData? _roomData;

//   @override
//   void initState() {
//     animationController =
//         AnimationController(duration: Duration(milliseconds: 400), vsync: this);

//     animationController.forward();

//     _roomData = RoomData(
//       numberRoom: widget.roomData.numberRoom,
//       adult: widget.roomData.adult,
//       children: widget.roomData.children
//     );

//     super.initState();
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appTheme = Provider.of<ThemeProvider>(context);
//     return Center(
//       child: Scaffold(
//         backgroundColor: appTheme.isLightMode
//             ? Colors.transparent
//             : Theme.of(context).backgroundColor.withOpacity(0.6),
//         body: AnimatedBuilder(
//           animation: animationController,
//           builder: (BuildContext context, Widget? child) {
//             return AnimatedOpacity(
//               duration: Duration(milliseconds: 100),
//               opacity: animationController.value,
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(24.0),
//                   child: CommonCard(
//                     color: AppTheme.backgroundColor,
//                     radius: 24,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Text(
//                             "Room Selected",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                         Divider(
//                           height: 1,
//                         ),
//                         getRowView("Number of Rooms", _roomData!.numberRoom, PopupTextType.no),
//                         getRowView("People Data", _roomData!.adult, PopupTextType.no),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 16, right: 16, bottom: 16, top: 24),
//                           child: CommonButton(
//                             buttonText: "Select",
//                             onTap: () {
//                               try {
//                                 widget.onChnage(
//                                   _roomData!,
//                                 );
//                                 Navigator.pop(context);
//                               } catch (e) {}
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget getRowView(String title, int count, PopupTextType popupTextType) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8, right: 8),
//       child: Column(
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: <Widget>[
//                           Divider(
//                             height: 1,
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 children: <Widget>[
//                                   Text(
//                                     title,
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(32.0),
//                               onTap: () {
//                                 setState(() {
//                                   if (popupTextType == PopupTextType.no) {
//                                     _roomData!.numberRoom += 1;
//                                   } else if (popupTextType ==
//                                       PopupTextType.ad) {
//                                     _roomData!.adult += 1;
//                                   }
//                                 });
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Icon(
//                                   Icons.add_circle_outline,
//                                   size: 28,
//                                   color: Theme.of(context).disabledColor,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Text(
//                             "  $count  ",
//                             style: TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                           Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(32.0),
//                               onTap: () {
//                                 setState(() {
//                                   if (popupTextType == PopupTextType.no) {
//                                     _roomData!.numberRoom -= 1;
//                                     if (_roomData!.numberRoom < 0) {
//                                       _roomData!.numberRoom = 0;
//                                     }
//                                   } else {
//                                     _roomData!.adult -= 1;
//                                     if (_roomData!.adult < 0) {
//                                       _roomData!.adult = 0;
//                                     }
//                                   }
//                                 });
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Icon(
//                                   Icons.remove_circle_outline,
//                                   size: 28,
//                                   color: Theme.of(context).disabledColor,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// enum PopupTextType { no, ad, ch }


import 'package:yatra1/utilis/roomdata.dart';
import 'package:flutter/material.dart';
import 'package:yatra1/appLocalization.dart';
import 'package:yatra1/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:yatra1/utils/themes.dart';
import 'package:yatra1/widgets/commonbutton.dart';
import 'package:yatra1/widgets/commoncard.dart';

class RoomPopupView extends StatefulWidget {
  final Function(RoomData) onChnage;
  final bool barrierDismissible;
  final RoomData roomData;

  const RoomPopupView({
    Key? key,
    required this.barrierDismissible,
    required this.onChnage,
    required this.roomData,
  }) : super(key: key);

  @override
  _RoomPopupViewState createState() => _RoomPopupViewState();
}

class _RoomPopupViewState extends State<RoomPopupView>
    with TickerProviderStateMixin {
  PopupTextType popupTextType = PopupTextType.no;
  late AnimationController animationController;

  DateTime? startDate;
  DateTime? endDate;
  RoomData? _adultRoomData;
  RoomData? _childrenRoomData;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);

    animationController.forward();

    _adultRoomData = RoomData(
      numberRoom: widget.roomData.numberRoom,
      adult: widget.roomData.adult,
      children: 0,
    );

    _childrenRoomData = RoomData(
      numberRoom: 0,
      adult: 0,
      children: widget.roomData.children,
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeProvider>(context);
    return Center(
      child: Scaffold(
        backgroundColor: appTheme.isLightMode
            ? Colors.transparent
            : Theme.of(context).backgroundColor.withOpacity(0.6),
        body: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) {
            return AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: animationController.value,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CommonCard(
                    color: AppTheme.backgroundColor,
                    radius: 24,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Room Selected",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        getRowView("Number of Rooms", _adultRoomData!.numberRoom, PopupTextType.no),
                        getRowView("Adults", _adultRoomData!.adult, PopupTextType.ad),
                        getRowView("Children", _childrenRoomData!.children, PopupTextType.ch),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16, top: 24),
                          child: CommonButton(
                            buttonText: "Select",
                            onTap: () {
                              try {
        RoomData combinedRoomData = RoomData(
          numberRoom: _adultRoomData!.numberRoom,
          adult: _adultRoomData!.adult,
          children: _childrenRoomData!.children,
        );
        widget.onChnage(combinedRoomData);
        Navigator.pop(context);
      } catch (e) {}
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getRowView(String title, int count, PopupTextType popupTextType) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Divider(
                            height: 1,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32.0),
                              onTap: () {
                                setState(() {
                                  if (popupTextType == PopupTextType.no) {
                                    _adultRoomData!.numberRoom += 1;
                                  } else if (popupTextType ==
                                      PopupTextType.ad) {
                                    _adultRoomData!.adult += 1;
                                  } else if (popupTextType ==
                                      PopupTextType.ch) {
                                    _childrenRoomData!.children += 1;
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.add_circle_outline,
                                  size: 28,
                                  color: Theme.of(context).disabledColor,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "  $count  ",
                            style: TextStyle(
                                                          fontSize: 16,
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32.0),
                              onTap: () {
                                setState(() {
                                  if (popupTextType == PopupTextType.no) {
                                    _adultRoomData!.numberRoom -= 1;
                                    if (_adultRoomData!.numberRoom < 0) {
                                      _adultRoomData!.numberRoom = 0;
                                    }
                                  } else if (popupTextType ==
                                      PopupTextType.ad) {
                                    _adultRoomData!.adult -= 1;
                                    if (_adultRoomData!.adult < 0) {
                                      _adultRoomData!.adult = 0;
                                    }
                                  } else if (popupTextType ==
                                      PopupTextType.ch) {
                                    _childrenRoomData!.children -= 1;
                                    if (_childrenRoomData!.children < 0) {
                                      _childrenRoomData!.children = 0;
                                    }
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  size: 28,
                                  color: Theme.of(context).disabledColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum PopupTextType { no, ad, ch }

