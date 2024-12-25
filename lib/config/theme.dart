import 'package:flutter/material.dart';
import 'package:news_app_with_getx/config/colors.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: lightBgcolor,
    filled: true,
    enabledBorder: InputBorder.none,
    prefixIconColor: lightlablecolor,
    labelStyle: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: lightfontcolor,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: lightfontcolor,
      fontWeight: FontWeight.w500,
    ),
  ),
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    // here we put surface instade of background
    surface: lightBgcolor,
    onSurface: lightfontcolor,
    primaryContainer: lightdivcolor,
    onPrimaryContainer: lightfontcolor,
    secondaryContainer: lightlablecolor,
    primary: lightPrimartcolor,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24,
      color: lightfontcolor,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      color: lightfontcolor,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: lightfontcolor,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      color: lightfontcolor,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: lightfontcolor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 13,
      color: lightfontcolor,
      fontWeight: FontWeight.w300,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 13,
      color: lightlablecolor,
      fontWeight: FontWeight.w500,
    ),
  ),
);

var darkTheme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: lightBgcolor,
    filled: true,
    enabledBorder: InputBorder.none,
    prefixIconColor: darklablecolor,
    labelStyle: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: darkfontcolor,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: darkfontcolor,
      fontWeight: FontWeight.w500,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.light,
    // here we put surface instade of background
    surface: darkBgcolor,
    onSurface: darkfontcolor,
    primaryContainer: Color.fromARGB(255, 77, 77, 77),
    onPrimaryContainer: darkfontcolor,
    secondaryContainer: darklablecolor,
    primary: darkPrimartcolor,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24,
      color: darkfontcolor,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      color: darkfontcolor,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: darkfontcolor,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      color: darkfontcolor,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: darkfontcolor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 13,
      color: darkfontcolor,
      fontWeight: FontWeight.w300,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 13,
      color: darklablecolor,
      fontWeight: FontWeight.w500,
    ),
  ),
);
