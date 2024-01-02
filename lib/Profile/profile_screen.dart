



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yatra1/providers/theme_provider.dart';
import 'package:yatra1/utilis/hotel_theme.dart';
import 'package:yatra1/utils/localfiles.dart';
import 'package:yatra1/utils/text_styles.dart';
import 'package:yatra1/utils/themes.dart';
import 'package:yatra1/widgets/bottomtopmoveanimationview.dart';
import 'package:provider/provider.dart';
import 'package:yatra1/utilis/settinglist.dart';
import 'package:yatra1/Profile/editprofile.dart'; 
import 'package:yatra1/Profile/settingscreen.dart'; 
import 'package:yatra1/Profile/helpcenter.dart';
import 'package:yatra1/Profile/invitescreen.dart'; 


// class ProfileScreen extends StatefulWidget {
//   final AnimationController animationController;

//   const ProfileScreen({Key? key, required this.animationController})
//       : super(key: key);

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   List<SettingsListData> userSettingsList = SettingsListData.userSettingsList;

//   @override
//   void initState() {
//     widget.animationController.forward();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     widget.animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: BottomTopMoveAnimationView(
//           animationController: widget.animationController,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding:
//                     EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//                 child: Container(child: appBar()),
//               ),
//               Expanded(
//                 child: Consumer<ThemeProvider>(
//                   builder: (context, provider, child) => ListView.builder(
//                     physics: BouncingScrollPhysics(),
//                     padding: EdgeInsets.all(0.0),
//                     itemCount: userSettingsList.length,
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () async {
//                           if (mounted && Navigator.canPop(context)) {
//                             Navigator.pop(context);
//                           }

//                           switch (index) {
//                             case 5:
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => SettingsScreen(),
//                                 ),
//                               );
//                               break;
//                             case 3:
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => HelpCenterScreen(),
//                                 ),
//                               );
//                               break;
//                             case 0:
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => InviteFriend(),
//                                 ),
//                               );
//                               break;
//                           }
//                         },
//                         child: Column(
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 8, right: 16, top: 8, bottom: 8),
//                               child: Row(
//                                 children: <Widget>[
//                                   Expanded(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(16.0),
//                                       child: Text(
//                                         userSettingsList[index].titleTxt,
//                                         style: TextStyles(context)
//                                             .getRegularStyle()
//                                             .copyWith(
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 16,
//                                             ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(16),
//                                     child: Container(
//                                       child: Icon(
//                                         userSettingsList[index].iconData,
//                                         color: AppTheme.secondaryTextColor
//                                             .withOpacity(0.7),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 16, right: 16, bottom: 8),
//                               child: Divider(
//                                 height: 1,
//                               ),
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget appBar() {
//     return InkWell(
//       onTap: () async {
//         if (mounted && Navigator.canPop(context)) {
//           Navigator.pop(context);
//         }

//         var index;
//         switch (index) {
//           case 5:
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => SettingsScreen(),
//               ),
//             );
//             break;
//           case 3:
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => HelpCenterScreen(),
//               ),
//             );
//             break;
//           case 0:
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => InviteFriend(),
//               ),
//             );
//             break;
//         }
//       },
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 24, right: 24),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Puja",
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Text(
//                     "View Edit",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Theme.of(context).disabledColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 right: 24, top: 16, bottom: 16, left: 24),
//             child: Container(
//               width: 70,
//               height: 70,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(40.0)),
//                 //  child: Image.asset(Localfiles.userImage),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
  
 
  
  
// }


class ProfileScreen extends StatefulWidget {
  final AnimationController animationController;

  const ProfileScreen({Key? key, required this.animationController})
      : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<SettingsListData> userSettingsList = SettingsListData.userSettingsList;
  late User? user;

  @override
  void initState() {
    super.initState();
    // Initialize Firebase Auth
    user = FirebaseAuth.instance.currentUser;
    widget.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BottomTopMoveAnimationView(
          animationController: widget.animationController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Container(child: appBar()),
              ),
              Expanded(
                child: Consumer<ThemeProvider>(
                  builder: (context, provider, child) => ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(0.0),
                    itemCount: userSettingsList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          if (mounted && Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }

                          switch (index) {
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingsScreen(),
                                ),
                              );
                              break;
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HelpCenterScreen(),
                                ),
                              );
                              break;
                            // case 0:
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => InviteFriend(),
                            //     ),
                            //   );
                            //   break;
                          }
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 16, top: 8, bottom: 8),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        userSettingsList[index].titleTxt,
                                        style: TextStyles(context)
                                            .getRegularStyle()
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Container(
                                      child: Icon(
                                        userSettingsList[index].iconData,
                                        color: AppTheme.secondaryTextColor
                                            .withOpacity(0.7),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 8),
                              child: Divider(
                                height: 1,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return InkWell(
      onTap: () async {
        if (mounted && Navigator.canPop(context)) {
          Navigator.pop(context);
        }

        var index;
        switch (index) {
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsScreen(),
              ),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HelpCenterScreen(),
              ),
            );
            break;
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InviteFriend(),
              ),
            );
            break;
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    user?.email ?? "User",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "View Edit",
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 24, top: 16, bottom: 16, left: 24),
            child: Container(
              width: 70,
              height: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                //  child: Image.asset(Localfiles.userImage),
              ),
            ),
          )
        ],
      ),
    );
  }
}