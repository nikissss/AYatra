// import 'package:flutter/material.dart';
// import 'package:yatra1/applocalization.dart';
// import 'package:yatra1/utils/text_styles.dart';
// import 'package:yatra1/utils/themes.dart';
// import 'package:yatra1/widgets/commoncard.dart';
// import 'package:yatra1/utilis/hotellistdata.dart';
// // import 'package:smooth_star_rating/smooth_star_rating.dart';

// class RatingView extends StatelessWidget {
//   final HotelListData hotelData;

//   const RatingView({Key? key, required this.hotelData}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CommonCard(
//       color: AppTheme.backgroundColor,
//       radius: 16,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 SizedBox(
//                   width: 60,
//                   child: Text(
//                     (hotelData.rating * 2).toStringAsFixed(1),
//                     textAlign: TextAlign.left,
//                     style: TextStyles(context).getBoldStyle().copyWith(
//                           fontSize: 38,
//                           color: Theme.of(context).primaryColor,
//                         ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 8, right: 8),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           AppLocalizations(context).of("Overall_rating"),
//                           textAlign: TextAlign.left,
//                           style: TextStyles(context).getRegularStyle().copyWith(
//                                 // fontWeight: FontWeight.w500,
//                                 fontSize: 14,
//                                 color: Theme.of(context)
//                                     .disabledColor
//                                     .withOpacity(0.8),
//                               ),
//                         ),
//                         // SmoothStarRating(
//                         //   allowHalfRating: true,
//                         //   starCount: 5,
//                         //   rating: hotelData.rating,
//                         //   size: 16,
//                         //   color: Theme.of(context).primaryColor,
//                         //   borderColor: Theme.of(context).primaryColor,
//                         // ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 4,
//             ),
//             getBarUI('room', 95.0, context),
//             SizedBox(
//               height: 4,
//             ),
//             getBarUI('service', 80.0, context),
//             SizedBox(
//               height: 4,
//             ),
//             getBarUI('location', 65.0, context),
//             SizedBox(
//               height: 4,
//             ),
//             getBarUI('price', 85, context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget getBarUI(String text, double percent, BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         SizedBox(
//           width: 60,
//           child: Text(
//             AppLocalizations(context).of(text),
//             textAlign: TextAlign.left,
//             style: TextStyles(context).getRegularStyle().copyWith(
//                   // fontWeight: FontWeight.w500,
//                   fontSize: 14,
//                   color: Theme.of(context).disabledColor.withOpacity(0.8),
//                 ),
//           ),
//         ),
//         SizedBox(
//           width: 8,
//         ),
//         Expanded(
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 flex: percent.toInt(),
//                 child: Padding(
//                     padding: const EdgeInsets.only(top: 2),
//                     child: SizedBox(
//                       height: 4,
//                       child: CommonCard(
//                         color: AppTheme.primaryColor,
//                         radius: 8,
//                       ),
//                     )),
//               ),
//               Expanded(
//                 flex: 100 - percent.toInt(),
//                 child: SizedBox(),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:yatra1/utilis/hotellistmodel.dart';
import 'package:yatra1/utils/text_styles.dart';
import 'package:yatra1/utils/themes.dart';
import 'package:yatra1/widgets/commoncard.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingView extends StatelessWidget {
  final HotelListData hotelData;

  const RatingView({Key? key, required this.hotelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      color: AppTheme.backgroundColor,
      radius: 16,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 60,
                  child: Text(
                    (hotelData.rating * 2).toStringAsFixed(1),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 38,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Overall Rating',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.8),
                          ),
                        ),
                        // SmoothStarRating(
                        //   allowHalfRating: true,
                        //   starCount: 5,
                        //   rating: hotelData.rating,
                        //   size: 16,
                        //   color: Theme.of(context).primaryColor,
                        //   borderColor: Theme.of(context).primaryColor,
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 4,
            ),
            getBarUI('Room', 95.0, context),
            SizedBox(
              height: 4,
            ),
            getBarUI('Service', 80.0, context),
            SizedBox(
              height: 4,
            ),
            getBarUI('Location', 65.0, context),
            SizedBox(
              height: 4,
            ),
            getBarUI('Price', 85, context),
          ],
        ),
      ),
    );
  }

  Widget getBarUI(String text, double percent, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 60,
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).disabledColor.withOpacity(0.8),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: percent.toInt(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: SizedBox(
                    height: 4,
                    child: CommonCard(
                      color: AppTheme.primaryColor,
                      radius: 8,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 100 - percent.toInt(),
                child: SizedBox(),
              )
            ],
          ),
        )
      ],
    );
  }
}
