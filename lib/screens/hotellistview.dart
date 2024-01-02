import 'package:flutter/material.dart';
import 'package:yatra1/utilis/hotellistmodel.dart';
import 'package:yatra1/utilis/hotel_theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:yatra1/utilis/hotellistmodel.dart';
import 'package:yatra1/utilis/hotel_theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelListView extends StatelessWidget {
  const HotelListView({
    Key? key,
    this.hotelData,
    this.callback,
    this.animation,
    this.animationController,
  }) : super(key: key);

  final HotelListData? hotelData;
  final Function? callback;
  final AnimationController? animationController;
  final Animation<double>? animation;



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (context, child) {
        
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 50 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(4, 4),
                      blurRadius: 16,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 2,
                            child: Image.network(
                              hotelData!.imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: HotelTheme.buildLightTheme().backgroundColor,
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            hotelData!.titleTxt,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                hotelData!.subTxt,
                                                style: TextStyle(color: Colors.black, fontSize: 14),
                                              ),
                                              const SizedBox(width: 4),
                                              Icon(
                                                Icons.location_on,
                                                size: 16,
                                                color: HotelTheme.buildLightTheme().primaryColor,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${hotelData!.dist} km to city',
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 4),
                                            child: Row(
                                              children: <Widget>[
                                                RatingBar(
                                                  ratingWidget: RatingWidget(
                                                    full: Icon(
                                                      Icons.star_rate_rounded,
                                                      color: HotelTheme.buildLightTheme().primaryColor,
                                                    ),
                                                    half: Icon(
                                                      Icons.star_half_rounded,
                                                      color: HotelTheme.buildLightTheme().primaryColor,
                                                    ),
                                                    empty: Icon(
                                                      Icons.star_border_rounded,
                                                      color: HotelTheme.buildLightTheme().primaryColor,
                                                    ),
                                                  ),
                                                  onRatingUpdate: (value) {},
                                                  itemPadding: EdgeInsets.zero,
                                                  initialRating: hotelData!.rating,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 24,
                                                ),
                                                Text(
                                                  '${hotelData!.reviews} Reviews',
                                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(right: 16, top: 8),
                                  //   child: Column(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     crossAxisAlignment: CrossAxisAlignment.end,
                                  //     children: [
                                  //       Text(
                                  //         'Rs. ${hotelData!.perNight}',
                                  //         textAlign: TextAlign.left,
                                  //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                  //       ),
                                  //       Text(
                                  //         '/perNight',
                                  //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                  //       )
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: Colors.transparent,
                            child: Icon(
                              Icons.favorite_border,
                              color: HotelTheme.buildLightTheme().primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}