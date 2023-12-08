// import 'package:flutter/material.dart';
// import 'package:yatra1/appLocalization.dart';
// import 'package:yatra1/utilis/hotellistdata.dart';
// import 'package:yatra1/utilis/roomdata.dart';
// import 'package:yatra1/utilis/hotellistdata.dart';
// import 'package:yatra1/providers/theme_provider.dart';
// import 'package:yatra1/utils/enum.dart';
// import 'package:yatra1/utils/themes.dart';
// import 'package:yatra1/widgets/customdialog.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:intl/intl.dart';

// import 'package:provider/provider.dart';
// BuildContext? applicationcontext; 
// class Helper {
//   static String getRoomText(RoomData roomData) {
//     return "${roomData.numberRoom} ${AppLocalizations(applicationcontext!).of("room_data")} ${roomData.people} ${AppLocalizations(applicationcontext!).of("people_data")}";
//   }

//   static String getDateText(DateText dateText) {
//     LanguageType _languageType = applicationcontext == null
//         ? LanguageType.en
//         : applicationcontext!.read<ThemeProvider>().languageType;
//     return "0${dateText.startDate} ${DateFormat('MMM', _languageType.toString().split(".")[1]).format(DateTime.now())} - 0${dateText.endDate} ${DateFormat('MMM', _languageType.toString().split(".")[1]).format(DateTime.now().add(Duration(days: 2)))}";
//   }

//   static String getLastSearchDate(DateText dateText) {
//     LanguageType _languageType = applicationcontext == null
//         ? LanguageType.en
//         : applicationcontext!.read<ThemeProvider>().languageType;
//     return "${dateText.startDate} - ${dateText.endDate} ${DateFormat('MMM', _languageType.toString().split(".")[1]).format(DateTime.now().add(Duration(days: 2)))}";
//   }

//  static String getPeopleandChildren(BuildContext context, RoomData roomData) {
//   LanguageType _languageType = context.read<ThemeProvider>().languageType;
//   return "${AppLocalizations(context, locale: _languageType).of("sleeps")} ${roomData.numberOfPeople} ${AppLocalizations(context, locale: _languageType).of("people_data")} + ${roomData.numberOfRooms} ${AppLocalizations(context, locale: _languageType).of("children")} ";
// }

//   static Widget ratingStar({double rating = 4.5}) {
//     return RatingBarIndicator(
//       rating: rating,
//       itemBuilder: (context, index) => Icon(
//         Icons.star,
//         color: AppTheme.primaryColor,
//       ),
//       itemCount: 5,
//       unratedColor: AppTheme.secondaryTextColor,
//       itemSize: 18.0,
//       direction: Axis.horizontal,
//     );
//   }

//   Future<bool> showCommonPopup(
//       String title, String descriptionText, BuildContext context,
//       {bool isYesOrNoPopup = false, bool barrierDismissible = true}) async {
//     bool isOkClick = false;
//     return await showDialog(
//       context: context,
//       barrierDismissible: barrierDismissible,
//       builder: (BuildContext context) => CustomDialog(
//         title: title,
//         description: descriptionText,
//         onCloseClick: () {
//           Navigator.of(context).pop();
//         },
//         actionButtonList: isYesOrNoPopup
//             ? <Widget>[
//                 CustomDialogActionButton(
//                   buttonText: "NO",
//                   color: Colors.green,
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 CustomDialogActionButton(
//                   buttonText: "YES",
//                   color: Colors.red,
//                   onPressed: () {
//                     isOkClick = true;
//                     Navigator.of(context).pop();
//                   },
//                 )
//               ]
//             : <Widget>[
//                 CustomDialogActionButton(
//                   buttonText: "OK",
//                   color: Colors.green,
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 )
//               ],
//       ),
//     ).then((_) {
//       return isOkClick;
//     });
//   }
//}

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:yatra1/providers/theme_provider.dart';
import 'package:yatra1/utilis/hotellistdata.dart';
import 'package:yatra1/utils/enum.dart';
import 'package:yatra1/utils/themes.dart';
import 'package:yatra1/widgets/customdialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Helper {
  static Map<String, Map<String, String>> _allTexts = {};

  static Future<void> loadLocalization(BuildContext context) async {
    final List<Map<String, String>> allTexts = [];

    List<dynamic> jsonData = json.decode(
      await DefaultAssetBundle.of(context)
          .loadString('lib/language/lang/language_text.json'),
    );

    for (var value in jsonData) {
      if (value is Map && value['text_id'] != null) {
        Map<String, String> texts = {};
        texts['text_id'] = value['text_id'] ?? '';
        texts['en'] = value['en'] ?? '';
        texts['fr'] = value['fr'] ?? '';
        texts['ar'] = value['ar'] ?? '';
        texts['ja'] = value['ja'] ?? '';
        allTexts.add(texts);
      }
    }

    for (var texts in allTexts) {
      _allTexts[texts['text_id']!] = texts;
    }
  }

  static String localize(BuildContext context, String textId) {
    LanguageType _languageType = context.read<ThemeProvider>().languageType;
    final Locale myLocale = Localizations.localeOf(context);

    if (myLocale.languageCode != '' && myLocale.languageCode.length == 2) {
      String newtext = '';
      final textData = _allTexts[textId];
      if (textData != null) {
        newtext = textData[_languageType.toString().split(".")[1]] ?? '';
        if (newtext != '') return newtext;
      }
      return '#Text is Empty#';
    } else {
      return '#LanguageCode Not Match#';
    }
  }

  static String getRoomText(RoomData roomData, BuildContext context) {
    return "${roomData.numberOfPeople} ${localize(context, "room_data")} ${roomData.numberOfRooms} ${localize(context, "people_data")}";
  }

  static String getDateText(DateText dateText, BuildContext context) {
    LanguageType _languageType = context.read<ThemeProvider>().languageType;
    return "0${dateText.startDate} ${DateFormat('MMM', _languageType.toString().split(".")[1]).format(DateTime.now())} - 0${dateText.endDate} ${DateFormat('MMM', _languageType.toString().split(".")[1]).format(DateTime.now().add(Duration(days: 2)))}";
  }

  static String getLastSearchDate(DateText dateText, BuildContext context) {
    LanguageType _languageType = context.read<ThemeProvider>().languageType;
    return "${dateText.startDate} - ${dateText.endDate} ${DateFormat('MMM', _languageType.toString().split(".")[1]).format(DateTime.now().add(Duration(days: 2)))}";
  }

  static String getPeopleandChildren(RoomData roomData, BuildContext context) {
    LanguageType _languageType = context.read<ThemeProvider>().languageType;
    return "${localize(context, "sleeps")} ${roomData.numberOfPeople} ${localize(context, "people_data")} + ${roomData.numberOfRooms} ${localize(context, "children")} ";
  }

  static Widget ratingStar({double rating = 4.5}) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: AppTheme.primaryColor,
      ),
      itemCount: 5,
      unratedColor: AppTheme.secondaryTextColor,
      itemSize: 18.0,
      direction: Axis.horizontal,
    );
  }

  static Future<bool> showCommonPopup(
      String title, String descriptionText, BuildContext context,
      {bool isYesOrNoPopup = false, bool barrierDismissible = true}) async {
    bool isOkClick = false;
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => CustomDialog(
        title: title,
        description: descriptionText,
        onCloseClick: () {
          Navigator.of(context).pop();
        },
        actionButtonList: isYesOrNoPopup
            ? <Widget>[
                CustomDialogActionButton(
                  buttonText: "NO",
                  color: Colors.green,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CustomDialogActionButton(
                  buttonText: "YES",
                  color: Colors.red,
                  onPressed: () {
                    isOkClick = true;
                    Navigator.of(context).pop();
                  },
                )
              ]
            : <Widget>[
                CustomDialogActionButton(
                  buttonText: "OK",
                  color: Colors.green,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
      ),
    ).then((_) {
      return isOkClick;
    });
  }
}
