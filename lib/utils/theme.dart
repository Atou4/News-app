
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';


class Apptheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkgrey,
    colorScheme: const ColorScheme.light(),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.dark(),
    textTheme: TextTheme(
      headline4: GoogleFonts.openSans(
          fontSize: 28, fontWeight: FontWeight.w800,color: AppColors.black),
      headline5: GoogleFonts.openSans(
          fontSize: 22, fontWeight: FontWeight.w400, color: AppColors.black,letterSpacing: 0.5,),
      headline6: GoogleFonts.openSans(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: AppColors.black),
      subtitle1: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: AppColors.black),
      subtitle2: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: AppColors.grey),
      bodyText1: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.black),
      bodyText2: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.black),
      button: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: AppColors.black),
      caption: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: AppColors.black),
      overline: GoogleFonts.openSans(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: AppColors.black),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      toolbarTextStyle:GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: AppColors.white),
      titleTextStyle: GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: AppColors.white),
      centerTitle: true,
    ),
    bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
      //selectedIconTheme: IconThemeData(size: 30),
      backgroundColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      elevation: 10.0,
      selectedItemColor: AppColors.black,
      unselectedItemColor: AppColors.white,
      selectedLabelStyle:TextStyle(color: AppColors.white, height: 1),
      unselectedLabelStyle:TextStyle(color: AppColors.grey, height: 1),
    ),
  );
}
