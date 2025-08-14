import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

const Color kPrimaryColor = Color(0xFF1A3B72);
const Color kSecondaryColor = Color(0xFF0D1B3D);
const Color kScaffoldBgColor = Color(0xFFF5F7FA);
const Color kAccentColor = Color(0xFFCCDBFF);
const Color proTextColor = Color(0xFF80A4FE);
const Color whiteColor = Color(0xFFFFFFFF);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kScaffoldBgColor,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: kPrimaryColor,
    onPrimary: Colors.white,
    secondary: kSecondaryColor,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: kScaffoldBgColor,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
  textTheme: GoogleFonts.interTextTheme(ThemeData(brightness: Brightness.light).textTheme),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kSecondaryColor,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: kPrimaryColor,
    onPrimary: Colors.white,
    secondary: kSecondaryColor,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: kSecondaryColor,
    onBackground: Colors.white,
    surface: Color(0xFF1A1A2E),
    onSurface: Colors.white,
  ),
  textTheme: GoogleFonts.interTextTheme(ThemeData(brightness: Brightness.dark).textTheme),
);

final BoxDecoration backgroundGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF000F33), // Dark navy blue
      Color(0xFF070707), // Almost black
    ],
  ),
);
