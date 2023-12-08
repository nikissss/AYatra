import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yatra1/appLocalization.dart';
import 'package:yatra1/utilis/hotellistdata.dart';
import 'package:yatra1/utils/helper.dart';
import 'package:yatra1/utils/text_styles.dart';
import 'package:yatra1/widgets/commonbutton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomBookView extends StatefulWidget {
  final HotelListData roomData;
  final AnimationController animationController;
  final Animation<double> animation;

  const RoomBookView({
    Key? key,
    required this.roomData,
    required this.animationController,
    required this.animation,
  }) : super(key: key);

  @override
  _RoomBookViewState createState() => _RoomBookViewState();
}

class _RoomBookViewState extends State<RoomBookView> {
  var pageController = PageController(initialPage: 0);


  Future<void> bookNow() async {
    try {
      // Get the current user's email from Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;
      String? userEmail = user?.email;

      if (userEmail != null) {
        // Store the booking information in Cloud Firestore
        await FirebaseFirestore.instance.collection('bookings').add({
          'userEmail': userEmail,
          // Add other relevant data
        });

        print('Booking successful!');
        // Consider showing a confirmation message or navigating to another screen.
      } else {
        print('User not logged in or email is null.');
      }
    } catch (e) {
      print('Error booking: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    List<String> images = widget.roomData.imagePath.split(" ");

    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation,
          child: Transform(
            transform: Matrix4.translationValues(
              0.0,
              40 * (1.0 - widget.animation.value),
              0.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildImageSlider(images),
                  _buildRoomDetails(),
                  Divider(
                    height: 1,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSlider(List<String> images) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.5,
          child: PageView(
            controller: pageController,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for (var image in images)
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: WormEffect(
              activeDotColor: Theme.of(context).primaryColor,
              dotColor: Theme.of(context).backgroundColor,
              dotHeight: 10.0,
              dotWidth: 10.0,
              spacing: 5.0,
            ),
            onDotClicked: (index) {},
          ),
        ),
      ],
    );
  }

  Widget _buildRoomDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
      child: Column(
        children: <Widget>[
          _buildTitleAndBookButton(),
          _buildPrice(),
          _buildDateAndMoreDetails(),
        ],
      ),
    );
  }

  Widget _buildTitleAndBookButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            widget.roomData.titleTxt,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: TextStyles(context).getBoldStyle().copyWith(fontSize: 24),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 38,
          child: CommonButton(
            buttonTextWidget: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 4, bottom: 4),
              child: GestureDetector(
                onTap: () {
                  // Call the bookNow function when the button is tapped
                  bookNow();
                },
                child: Text(
                  "book_now",
                  textAlign: TextAlign.center,
                  style: TextStyles(context).getRegularStyle(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "\$${widget.roomData.perNight}",
          textAlign: TextAlign.left,
          style: TextStyles(context).getBoldStyle().copyWith(fontSize: 22),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Text(
            "per_night",
            style: TextStyles(context).getRegularStyle().copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildDateAndMoreDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          Helper.getPeopleandChildren(widget.roomData.roomData!, context),
          textAlign: TextAlign.left,
          style: TextStyles(context).getDescriptionStyle(),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          onTap: () {
            // Handle more details tap
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "more_details",
                  style: TextStyles(context).getBoldStyle(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 24,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
