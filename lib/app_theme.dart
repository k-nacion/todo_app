import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const baseColor = Color(0xFFE43F6F);
  static const baseColorLight = Color(0xFFFF466F);
  static const baseColorLighter = Color(0xFFFF4663);
  static const baseColorDark = Color(0xFFB13056);
  static const baseColorDarker = Color(0xFF972949);

  static const foregroundBaseColor = Colors.white;

  static const secondaryColor = Color(0xFF008DD5);

  static ThemeData generateGlobalAppTheme([BuildContext? context]) {
    final fontFamily = GoogleFonts.interTextTheme();

    return ThemeData(
      primaryColor: baseColor,
      // scaffoldBackgroundColor: Colors.white.withOpacity(.8),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colours.swatch(baseColor),
        accentColor: secondaryColor,
      ),
      textTheme: fontFamily,
    );
  }
}
