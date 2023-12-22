
import 'package:flutter/material.dart';
import 'package:yatra1/Profile/howdoscreen.dart';
import 'package:yatra1/utils/text_styles.dart';
import 'package:yatra1/utils/themes.dart';
import 'package:yatra1/widgets/commonappbarview.dart';
import 'package:yatra1/widgets/commoncard.dart';
import 'package:yatra1/widgets/commonsearchbar.dart';
import 'package:yatra1/widgets/removefocuse.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yatra1/utilis/settinglist.dart';

// class HelpCenterScreen extends StatefulWidget {
//   @override
//   _HelpCenterScreenState createState() => _HelpCenterScreenState();
// }

// class _HelpCenterScreenState extends State<HelpCenterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     List<SettingsListData> helpSearchList = SettingsListData.helpSearchList;
//     return Scaffold(
//       body: RemoveFocuse(
//         onClick: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               color: Theme.of(context).primaryColor,
//               child: Padding(
//                 padding: EdgeInsets.only(bottom: 24),
//                 child: appBar(),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 padding: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).padding.bottom),
//                 itemCount: helpSearchList.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: helpSearchList[index].subTxt != ""
//                         ? () {
//                          //  NavigationServices(context).gotoHowDoScreen();
//                           }
//                         : null,
//                     child: Column(
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8, right: 16),
//                           child: Row(
//                             children: <Widget>[
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Text(
//                                     helpSearchList[index].titleTxt != ""
//                                         ? helpSearchList[index].titleTxt
//                                         : helpSearchList[index].subTxt,
//                                     style: TextStyles(context)
//                                         .getRegularStyle()
//                                         .copyWith(
//                                             fontWeight: helpSearchList[index]
//                                                         .titleTxt !=
//                                                     ""
//                                                 ? FontWeight.bold
//                                                 : FontWeight.normal,
//                                             fontSize: helpSearchList[index]
//                                                         .titleTxt !=
//                                                     ""
//                                                 ? 18
//                                                 : 14),
//                                   ),
//                                 ),
//                               ),
//                               helpSearchList[index].subTxt != ""
//                                   ? Padding(
//                                       padding: const EdgeInsets.all(16),
//                                       child: Icon(Icons.keyboard_arrow_right,
//                                           color: Theme.of(context)
//                                               .disabledColor
//                                               .withOpacity(0.3)),
//                                     )
//                                   : SizedBox()
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 16, right: 16),
//                           child: Divider(
//                             height: 1,
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget appBar() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         CommonAppbarView(
//           onBackClick: () {
//             Navigator.pop(context);
//           },
//           iconData: Icons.arrow_back,
//           titleText: "How can we help you?", // Replace with your title text
//         ),
//         Padding(
//             padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
//             child: CommonCard(
//               color: AppTheme.backgroundColor,
//               radius: 36,
//               child: CommonSearchBar(
//                 iconData: FontAwesomeIcons.search,
//                 text: "Search help articles", // Replace with your search placeholder text
//               ),
//             )),
//       ],
//     );
//   }
// }





class HelpCenterScreen extends StatefulWidget {
  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    List<SettingsListData> helpSearchList = SettingsListData.helpSearchList;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: appBar(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                itemCount: helpSearchList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (helpSearchList[index].subTxt != "") {
                        // Navigate to HowDoScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HowDoScreen(),
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 16),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    helpSearchList[index].titleTxt != ""
                                        ? helpSearchList[index].titleTxt
                                        : helpSearchList[index].subTxt,
                                    style: TextStyle(
                                      fontWeight:
                                          helpSearchList[index].titleTxt != ""
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                      fontSize:
                                          helpSearchList[index].titleTxt != ""
                                              ? 18
                                              : 14,
                                    ),
                                  ),
                                ),
                              ),
                              helpSearchList[index].subTxt != ""
                                  ? Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Theme.of(context)
                                            .disabledColor
                                            .withOpacity(0.3),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Divider(
                            height: 1,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CommonAppbarView(
          onBackClick: () {
            Navigator.pop(context);
          },
          iconData: Icons.arrow_back,
          titleText: "How can we help you?",
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
          child: CommonCard(
            color: Theme.of(context).backgroundColor,
            radius: 36,
            child: InkWell(
              onTap: () {
                // Navigate to HowDoScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HowDoScreen(),
                  ),
                );
              },
              child: CommonSearchBar(
                iconData: FontAwesomeIcons.search,
                text: "Search help articles",
              ),
            ),
          ),
        ),
      ],
    );
  }
}