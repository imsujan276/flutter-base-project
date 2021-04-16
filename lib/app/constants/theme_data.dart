import 'package:blood_finder/app/constants/constants.dart';
import 'package:flutter/material.dart';

class Themes {
  static const Color PRIMARY_COLOR = Color(0xFF35B4C5);
  static const Color PRIMARY_COLOR_LIGHT = Color(0xFFA5CFF1);
  static const Color PRIMARY_COLOR_DARK = Color(0xFF0D3656);
  static const Color ACCENT_COLOR = Color(0xFF1717BA);
  static const Color WHITE = Color(0xFFFFFFFF);
  static const Color BLACK = Color(0xFF000000);
  static const Color GREY = Color(0xFF9F9F9F);
  static const Color GREY50 = Color(0xFFFAFAFA);
  static const Color RED = Color(0xFFFF0000);

  ///light theme data
  static final light = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: PRIMARY_COLOR,
    accentColor: ACCENT_COLOR,
    backgroundColor: PRIMARY_COLOR_LIGHT,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Themes.GREY, // background
        onPrimary: Themes.BLACK, // foreground/text
        onSurface: Themes.GREY, // disabled
        textStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: Constants.defaultFontSize,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.purple, // foreground/text
        backgroundColor: Colors.amber, // background
        textStyle: TextStyle(
          fontSize: Constants.defaultFontSize,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.white, // foreground
        onSurface: Colors.grey, // disabled
        backgroundColor: Colors.teal, // background
      ),
    ),
  );

  static Color darkBackgroundColor = const Color(0xFF0D3656);
  static Color darkPrimaryColor = const Color(0xFF0D3656);
  static Color darkAccentColor = Colors.blueGrey.shade600;
  static Color darkParticlesColor = const Color(0x441C2A3D);

  ///dark theme data
  static final dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    accentColor: darkAccentColor,
    backgroundColor: darkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
