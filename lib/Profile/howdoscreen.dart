// import 'package:flutter/material.dart';
// import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
// import 'package:yatra1/utils/text_styles.dart';
// import 'package:yatra1/utils/themes.dart';
// import 'package:yatra1/widgets/commonappbarview.dart';
// import 'package:yatra1/widgets/removefocuse.dart';
// import 'package:yatra1/utilis/settinglist.dart';

// class HowDoScreen extends StatefulWidget {
//   final String title;

//   const HowDoScreen({Key? key, this.title = ""}) : super(key: key);
//   @override
//   _HowDoScreenState createState() => _HowDoScreenState();
// }

// class _HowDoScreenState extends State<HowDoScreen> {
//   List<SettingsListData> subHelpList = SettingsListData.subHelpList;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         backgroundColor: AppTheme.scaffoldBackgroundColor,
//         body: RemoveFocuse(
//           onClick: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//           },
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               CommonAppbarView(
//                 titleText: "How do i cancle my rooms reservation",
//                 iconData: Icons.arrow_back,
//                 onBackClick: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   padding: EdgeInsets.only(
//                       bottom: 16 + MediaQuery.of(context).padding.bottom),
//                   itemCount: subHelpList.length,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: subHelpList[index].isSelected ? () {} : null,
//                       child: Column(
//                         children: <Widget>[
//                           Text(subHelpList[index].titleTxt),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8, right: 8),
//                             child: Row(
//                               children: <Widget>[
//                                 Expanded(
//                                   child: subHelpList[index].titleTxt != ""
//                                       ? Padding(
//                                           padding: const EdgeInsets.all(16.0),
//                                           child: Text(
//                                             subHelpList[index].titleTxt,
//                                             style: TextStyles(context)
//                                                 .getBoldStyle()
//                                                 .copyWith(fontSize: 18),
//                                           ),
//                                         )
//                                       : Padding(
//                                           padding: const EdgeInsets.only(
//                                               left: 16,
//                                               right: 16,
//                                               top: 8,
//                                               bottom: 16),
//                                           child: Container(
//                                             child: Text(
//                                               AppLocalizations(context).of(
//                                                   subHelpList[index].subTxt),
//                                               //   subHelpList[index].subTxt,
//                                               style: TextStyles(context)
//                                                   .getRegularStyle()
//                                                   .copyWith(
//                                                     fontSize: 16,
//                                                     color: subHelpList[index]
//                                                             .isSelected
//                                                         ? AppTheme.primaryColor
//                                                         : AppTheme
//                                                             .secondaryTextColor,
//                                                   ),
//                                             ),
//                                           ),
//                                         ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           subHelpList[index].isSelected
//                               ? Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 16, right: 16),
//                                   child: Divider(
//                                     height: 1,
//                                   ),
//                                 )
//                               : SizedBox()
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:yatra1/utils/text_styles.dart';
import 'package:yatra1/utils/themes.dart';
import 'package:yatra1/widgets/commonappbarview.dart';
import 'package:yatra1/widgets/removefocuse.dart';
import 'package:yatra1/utilis/settinglist.dart';

class HowDoScreen extends StatefulWidget {
  final String title;

  const HowDoScreen({Key? key, this.title = ""}) : super(key: key);
  @override
  _HowDoScreenState createState() => _HowDoScreenState();
}

class _HowDoScreenState extends State<HowDoScreen> {
  List<SettingsListData> subHelpList = SettingsListData.subHelpList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppTheme.scaffoldBackgroundColor,
        body: RemoveFocuse(
          onClick: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonAppbarView(
                titleText: "How do I cancel my room reservation", // Replace with your title text
                iconData: Icons.arrow_back,
                onBackClick: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(
                      bottom: 16 + MediaQuery.of(context).padding.bottom),
                  itemCount: subHelpList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: subHelpList[index].isSelected ? () {} : null,
                      child: Column(
                        children: <Widget>[
                          Text(subHelpList[index].titleTxt),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: subHelpList[index].titleTxt != ""
                                      ? Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            subHelpList[index].titleTxt,
                                            style: TextStyles(context)
                                                .getBoldStyle()
                                                .copyWith(fontSize: 18),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16,
                                              right: 16,
                                              top: 8,
                                              bottom: 16),
                                          child: Container(
                                            child: Text(
                                              subHelpList[index].subTxt,
                                              style: TextStyles(context)
                                                  .getRegularStyle()
                                                  .copyWith(
                                                    fontSize: 16,
                                                    color: subHelpList[index]
                                                            .isSelected
                                                        ? AppTheme.primaryColor
                                                        : AppTheme
                                                            .secondaryTextColor,
                                                  ),
                                            ),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          subHelpList[index].isSelected
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Divider(
                                    height: 1,
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
