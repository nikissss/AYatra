
import 'package:flutter/material.dart';
import 'package:yatra1/screens/bottom_bar.dart';
import 'package:yatra1/utils/localfiles.dart';
import 'package:yatra1/utils/text_styles.dart';
import 'package:yatra1/utils/themes.dart';
import 'package:yatra1/providers/theme_provider.dart';
import 'package:yatra1/widgets/commonbutton.dart';
import 'package:provider/provider.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   bool isLoadText = false;

//   @override
//   void initState() {
//     WidgetsBinding.instance!.addPostFrameCallback((_) =>
//         _loadAppData()); // call after the first frame receiver so we have context
//     super.initState();
//   }

//   Future<void> _loadAppData() async {
//     try {
//       // Load any initial data needed here
//       setState(() {
//         isLoadText = true;
//       });
//     } catch (_) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appTheme = Provider.of<ThemeProvider>(context);
//     return Container(
//       child: Scaffold(
//         body: Stack(
//           children: <Widget>[
//             Container(
//               foregroundDecoration: !appTheme.isLightMode
//                   ? BoxDecoration(
//                       color: Theme.of(context).backgroundColor.withOpacity(0.4))
//                   : null,
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: Image.asset(Localfiles.introduction, fit: BoxFit.cover),
//             ),
//             Column(
//               children: <Widget>[
//                 Expanded(
//                   flex: 1,
//                   child: SizedBox(),
//                 ),
//                 Center(
//                   child: Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(8.0),
//                       ),
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                           color: Theme.of(context).dividerColor,
//                           offset: Offset(1.1, 1.1),
//                           blurRadius: 10.0,
//                         ),
//                       ],
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(8.0),
//                       ),
//                       child: Image.asset(Localfiles.appIcon),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Text(
//                   "Motel",
//                   textAlign: TextAlign.left,
//                   style: TextStyles(context).getBoldStyle().copyWith(
//                         fontSize: 24,
//                       ),
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 AnimatedOpacity(
//                   opacity: isLoadText ? 1.0 : 0.0,
//                   duration: Duration(milliseconds: 420),
//                   child: Text(
//                     "Best Hotel Deals",
//                     textAlign: TextAlign.left,
//                     style: TextStyles(context).getRegularStyle().copyWith(),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 4,
//                   child: SizedBox(),
//                 ),
//                 AnimatedOpacity(
//                   opacity: isLoadText ? 1.0 : 0.0,
//                   duration: Duration(milliseconds: 680),
//                   child: CommonButton(
//                     padding: const EdgeInsets.only(
//                         left: 48, right: 48, bottom: 8, top: 8),
//                     buttonText: "Get Started",
//                     onTap: () {
//                       // Replace the navigation logic as needed
//                       // NavigationServices(context).gotoIntroductionScreen();
//                     },
//                   ),
//                 ),
//                 AnimatedOpacity(
//                   opacity: isLoadText ? 1.0 : 0.0,
//                   duration: Duration(milliseconds: 1200),
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       bottom: 24.0 + MediaQuery.of(context).padding.bottom,
//                       top: 16,
//                     ),
//                     child: Text(
//                       "Already have an account?",
//                       textAlign: TextAlign.left,
//                       style: TextStyles(context)
//                           .getDescriptionStyle()
//                           .copyWith(color: AppTheme.whiteColor),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
   // _navigatetohome();
  }
_navigatetohome()async{
  await Future.delayed(Duration(milliseconds: 1500),(){});
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BottomBar()));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.blueGrey,
            ),
            Container(
              child: Text("Splash Screen",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}