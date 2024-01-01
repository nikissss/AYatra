
// import 'package:flutter/material.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:yatra1/Dashboard/desktopscreen.dart';
// import 'package:yatra1/Dashboard/mobilescreen.dart';
// import 'package:yatra1/Dashboard/tabletscreen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return ResponsiveBuilder(
// //       builder: (context, sizingInformation) {
// //         if (sizingInformation.isDesktop) {
// //           return const DesktopScreen();
// //         }
// //         if (sizingInformation.isTablet) {
// //           return const TabletScreen();
// //         }
// //         return MobileScreen(user: null,);
// //       },
// //     );
// //   }
// // }

// @override
// Widget build(BuildContext context) {
//   return SafeArea(
//     child: ResponsiveBuilder(
//       builder: (context, sizingInformation) {
//         if (sizingInformation.isDesktop) {
//           return const DesktopScreen();
//         }
//         if (sizingInformation.isTablet) {
//           return const TabletScreen();
//         }
//         return MobileScreen(user: null);
//       },
//     ),
//   );
// }
// }
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:yatra1/Dashboard/desktopscreen.dart';
import 'package:yatra1/Dashboard/mobilescreen.dart';
import 'package:yatra1/Dashboard/tabletscreen.dart';
import 'package:yatra1/views/login_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('YATRA'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => _gotoSplashScreen(context),
            ),
          ],
        ),
        body: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.isDesktop) {
              return const DesktopScreen();
            }
            if (sizingInformation.isTablet) {
              return const TabletScreen();
            }
            return MobileScreen(user: null);
          },
        ),
      ),
    );
  }

  void _gotoSplashScreen(BuildContext context) async {
    bool isOk = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are you sure?"),
          content: Text("You want to Sign Out."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // User pressed No
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // User pressed Yes
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );

    if (isOk == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Loginpage(context: context, onTap: () {}),
        ),
      );
    }
  }
}
