// import 'package:flutter/material.dart';
// import 'package:yatra1/widgets/commonappbarview.dart';
// import 'package:yatra1/utilis/hotellistdata.dart';
// import 'reviewdataview.dart';

// class ReviewsListScreen extends StatefulWidget {
//   @override
//   _ReviewsListScreenState createState() => _ReviewsListScreenState();
// }

// class _ReviewsListScreenState extends State<ReviewsListScreen>
//     with TickerProviderStateMixin {
//   List<HotelListData> reviewsList = HotelListData.reviewsList;
//   late AnimationController animationController;
//   @override
//   void initState() {
//     animationController = AnimationController(
//         duration: Duration(milliseconds: 2000), vsync: this);
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
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           CommonAppbarView(
//             iconData: Icons.close,
//             onBackClick: () {
//               Navigator.pop(context);
//             },
//             titleText: "Review(20)",
//           ),
//           // animation of Review and feedback data
//           Expanded(
//             child: ListView.builder(
//               physics: BouncingScrollPhysics(),
//               padding: EdgeInsets.only(
//                   top: 8, bottom: MediaQuery.of(context).padding.bottom + 8),
//               itemCount: reviewsList.length,
//               itemBuilder: (context, index) {
//                 var count = reviewsList.length > 10 ? 10 : reviewsList.length;
//                 var animation = Tween(begin: 0.0, end: 1.0).animate(
//                     CurvedAnimation(
//                         parent: animationController,
//                         curve: Interval((1 / count) * index, 1.0,
//                             curve: Curves.fastOutSlowIn)));
//                 animationController.forward();
//                 // page to redirect the feedback and review data
//                 return ReviewsView(
//                   callback: () {},
//                   reviewsList: reviewsList[index],
//                   animation: animation,
//                   animationController: animationController,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// //   Widget appBar() {
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: <Widget>[
// //         SizedBox(
// //           height: AppBar().preferredSize.height,
// //           child: Padding(
// //             padding: EdgeInsets.only(top: 8, left: 8),
// //             child: Container(
// //               width: AppBar().preferredSize.height - 8,
// //               height: AppBar().preferredSize.height - 8,
// //               child: Material(
// //                 color: Colors.transparent,
// //                 child: InkWell(
// //                   borderRadius: BorderRadius.all(
// //                     Radius.circular(32.0),
// //                   ),
// //                   onTap: () {
// //                     Navigator.pop(context);
// //                   },
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Icon(Icons.close),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //         Padding(
// //           padding: const EdgeInsets.only(top: 4, left: 24),
// //           child: Text(
// //             "Reviews (20)",
// //             style: new TextStyle(
// //               fontSize: 22,
// //               fontWeight: FontWeight.w700,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:yatra1/utilis/hotellistmodel.dart';
// import 'package:yatra1/utils/text_styles.dart';
// import 'package:yatra1/utils/themes.dart';
// import 'package:yatra1/widgets/commoncard.dart';
// import 'package:yatra1/widgets/listcellanimationview.dart';
// import 'package:yatra1/utilis/hotellistdata.dart';

// class ReviewsView extends StatelessWidget {
//   final VoidCallback callback;
//   final HotelListData reviewsList;
//   final AnimationController animationController;
//   final Animation<double> animation;

//   const ReviewsView({
//     Key? key,
//     required this.reviewsList,
//     required this.animationController,
//     required this.animation,
//     required this.callback,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListCellAnimationView(
//       animation: animation,
//       animationController: animationController,
//       yTranslation: 40,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
//         child: Column(
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     width: 48,
//                     child: CommonCard(
//                       radius: 8,
//                       color: AppTheme.whiteColor,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                         child: AspectRatio(
//                           aspectRatio: 1,
//                           child: Image.asset(
//                             reviewsList.imagePath,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       reviewsList.titleTxt,
//                       style: TextStyles(context).getBoldStyle().copyWith(
//                             fontSize: 14,
//                           ),
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           'Last Update',
//                           style: new TextStyles(context)
//                               .getDescriptionStyle()
//                               .copyWith(
//                                 fontWeight: FontWeight.w100,
//                                 color: Theme.of(context).disabledColor,
//                               ),
//                         ),
//                         Text(
//                           reviewsList.dateTxt,
//                           style: new TextStyles(context)
//                               .getDescriptionStyle()
//                               .copyWith(
//                                 fontWeight: FontWeight.w100,
//                                 color: Theme.of(context).disabledColor,
//                               ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: <Widget>[
//                         Text(
//                           "(${reviewsList.rating})",
//                           style: new TextStyles(context)
//                               .getRegularStyle()
//                               .copyWith(
//                                 fontWeight: FontWeight.w100,
//                               ),
//                         ),
//                         //   SmoothStarRating(
//                         //     allowHalfRating: true,
//                         //     starCount: 5,
//                         //     rating: reviewsList.rating / 2,
//                         //     size: 16,
//                         //     color: Theme.of(context).primaryColor,
//                         //     borderColor: Theme.of(context).primaryColor,
//                         //   ),
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 reviewsList.subTxt,
//                 style: TextStyles(context).getDescriptionStyle().copyWith(
//                       fontWeight: FontWeight.w100,
//                       color: Theme.of(context).disabledColor,
//                     ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                     onTap: () {},
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 8),
//                       child: Row(
//                         children: <Widget>[
//                           Text(
//                             'Reply',
//                             textAlign: TextAlign.left,
//                             style:
//                                 TextStyles(context).getRegularStyle().copyWith(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14,
//                                       color: Theme.of(context).primaryColor,
//                                     ),
//                           ),
//                           SizedBox(
//                             height: 38,
//                             width: 26,
//                             child: Icon(
//                               Icons.arrow_forward,
//                               size: 14,
//                               color: Theme.of(context).primaryColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Divider(
//               height: 1,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:yatra1/utils/text_styles.dart';
import 'package:yatra1/utils/themes.dart';
import 'package:yatra1/widgets/commoncard.dart';
import 'package:yatra1/widgets/listcellanimationview.dart';
import 'package:yatra1/utilis/hotellistdata.dart';

class ReviewsView extends StatelessWidget {
  final VoidCallback callback;
  final HotelListData reviewsList;
  final AnimationController animationController;
  final Animation<double> animation;

  const ReviewsView({
    Key? key,
    required this.reviewsList,
    required this.animationController,
    required this.animation,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCellAnimationView(
      animation: animation,
      animationController: animationController,
      yTranslation: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 48,
                    child: CommonCard(
                      radius: 8,
                      color: AppTheme.whiteColor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            reviewsList.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      reviewsList.titleTxt,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Last Update',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                        Text(
                          reviewsList.dateTxt,
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "(${reviewsList.rating})",
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                reviewsList.subTxt,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Reply',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 38,
                            width: 26,
                            child: Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
