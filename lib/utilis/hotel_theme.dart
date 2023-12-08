

import 'package:flutter/material.dart';
import 'package:yatra1/utilis/app_styles.dart';

class HotelTheme {
  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(fontFamily: fontName),
      displayMedium: base.displayMedium?.copyWith(fontFamily: fontName),
      displaySmall: base.displaySmall?.copyWith(fontFamily: fontName),
      headlineMedium: base.headlineMedium?.copyWith(fontFamily: fontName),
      headlineSmall: base.headlineSmall?.copyWith(fontFamily: fontName),
      titleLarge: base.titleLarge?.copyWith(fontFamily: fontName),
      labelLarge: base.labelLarge?.copyWith(fontFamily: fontName),
      bodyLarge: base.bodyLarge?.copyWith(fontFamily: fontName),
      bodyMedium: base.bodyMedium?.copyWith(fontFamily: fontName),
      titleMedium: base.titleMedium?.copyWith(fontFamily: fontName),
      labelSmall: base.labelSmall?.copyWith(fontFamily: fontName),
      bodySmall: base.bodySmall?.copyWith(fontFamily: fontName),
      titleSmall: base.titleSmall?.copyWith(fontFamily: fontName),
    );
  }

  static ThemeData buildLightTheme() {
    const Color primaryColor = Color(0xff7ba67);
    const Color secondaryColor = Color(0xff7fBa67);
const Color trenaryColor = Colors.blueGrey;
    ColorScheme colorScheme = ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );

    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: const Color(0xFFF6f6f6),
      colorScheme: colorScheme
          .copyWith(background: Colors.grey)
          .copyWith(error: const Color(0xffb00020)),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      platform: TargetPlatform.android,
    );
  }
}
