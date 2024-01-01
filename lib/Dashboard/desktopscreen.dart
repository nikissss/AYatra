
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:yatra1/Dashboard/bodycontentwidget.dart';
import 'package:yatra1/Dashboard/rightsidewidget.dart';
import 'package:yatra1/Dashboard/webverticalnavwidget.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, sizingInformation) {
      return Scaffold(
        body: Row(
          children: [
            const WebVerticalNavWidget(),
            BodyContentWidget(
                sizingInformation: sizingInformation,
                key: const Key('body_content_widget')),
            const RightSideWidget()
          ],
        ),
      );
    });
  }
}