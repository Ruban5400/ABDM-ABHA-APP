import 'package:abha/utils/common/dimes.dart';
import 'package:abha/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum AppTheme { light, dark }

ThemeData lightTheme = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: AppColors.colorAppBlue,
  primaryColorLight: AppColors.colorWhite,
  primaryColorDark: AppColors.colorAppBlue,
  brightness: Brightness.light,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 0,
    foregroundColor: AppColors.colorWhite,
    backgroundColor: AppColors.colorAppBlue,
  ),
  dividerColor: AppColors.colorWhiteAliceBlue,
  focusColor: AppColors.colorWhiteAliceBlue,
  hintColor: AppColors.colorGrey,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  canvasColor: AppColors.colorWhite,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: Dimen.d_40,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    displayMedium: TextStyle(
      fontSize: Dimen.d_34,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    displaySmall: TextStyle(
      fontSize: Dimen.d_30,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    headlineLarge: TextStyle(
      fontSize: Dimen.d_34,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    headlineMedium: TextStyle(
      fontSize: Dimen.d_30,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    headlineSmall: TextStyle(
      fontSize: Dimen.d_24,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    bodyLarge: TextStyle(
      fontSize: Dimen.d_20,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    bodyMedium: TextStyle(
      fontSize: Dimen.d_18,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    bodySmall: TextStyle(
      fontSize: Dimen.d_16,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    titleLarge: TextStyle(
      fontSize: Dimen.d_20,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    titleMedium: TextStyle(
      fontSize: Dimen.d_15,
      color: AppColors.colorGreyDark4,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.0,
      decorationThickness: 1.0,
    ),
    titleSmall: TextStyle(
      fontSize: Dimen.d_15,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    labelLarge: TextStyle(
      fontSize: Dimen.d_15,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    labelMedium: TextStyle(
      fontSize: Dimen.d_12,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    labelSmall: TextStyle(
      fontSize: Dimen.d_10,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(
      fontSize: Dimen.d_17,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.colorWhite,
    unselectedLabelStyle:
        TextStyle(fontSize: Dimen.d_14, fontWeight: FontWeight.w500),
    selectedLabelStyle:
        TextStyle(fontSize: Dimen.d_14, fontWeight: FontWeight.w500),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.colorAppBlue,
    primary: AppColors.colorAppBlue,
  ),
);

ThemeData darkTheme = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: AppColors.colorAppBlue,
  primaryColorLight: AppColors.colorWhite,
  primaryColorDark: AppColors.colorAppBlue,
  brightness: Brightness.light,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 0,
    foregroundColor: AppColors.colorWhite,
    backgroundColor: AppColors.colorAppBlue,
  ),
  dividerColor: AppColors.colorWhiteAliceBlue,
  focusColor: AppColors.colorWhiteAliceBlue,
  hintColor: AppColors.colorGrey,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  canvasColor: AppColors.colorWhite,
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(
      fontSize: Dimen.d_17,
      fontWeight: FontWeight.w600,
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: Dimen.d_45,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    displayMedium: TextStyle(
      fontSize: Dimen.d_40,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    displaySmall: TextStyle(
      fontSize: Dimen.d_35,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    headlineMedium: TextStyle(
      fontSize: Dimen.d_30,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    headlineSmall: TextStyle(
      fontSize: Dimen.d_25,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    titleLarge: TextStyle(
      fontSize: Dimen.d_20,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    titleMedium: TextStyle(
      fontSize: Dimen.d_20,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.0,
      height: 1.0,
      decorationThickness: 1.0,
    ),
    titleSmall: TextStyle(
      fontSize: Dimen.d_15,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    bodyLarge: TextStyle(
      fontSize: Dimen.d_20,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    bodyMedium: TextStyle(
      fontSize: Dimen.d_18,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    labelLarge: TextStyle(
      fontSize: Dimen.d_20,
      color: AppColors.colorWhite,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    bodySmall: TextStyle(
      fontSize: Dimen.d_12,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
    labelSmall: TextStyle(
      fontSize: Dimen.d_10,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.0,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.colorWhite,
    elevation: 4.0,
    selectedLabelStyle: TextStyle(color: AppColors.colorAppBlue, height: 1.5),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.colorAppBlue,
  ),
);

/*ThemeData lightTheme = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: AppColors.colorAppBlue,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 0,
    foregroundColor: AppColors.colorWhite,
  ),
  brightness: Brightness.light,
  dividerColor: AppColors.colorWhiteAliceBlue,
  focusColor: AppColors.colorWhiteAliceBlue,
  hintColor: AppColors.colorGrey,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  canvasColor: AppColors.colorWhite,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: Dimen.d_45,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    headline2: TextStyle(
      fontSize: Dimen.d_40,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    headline3: TextStyle(
      fontSize: Dimen.d_35,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    headline4: TextStyle(
      fontSize: Dimen.d_30,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    headline5: TextStyle(
      fontSize: Dimen.d_25,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    headline6: TextStyle(
      fontSize: Dimen.d_20,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    subtitle1: TextStyle(
      fontSize: Dimen.d_20,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    subtitle2: TextStyle(
      fontSize: Dimen.d_15,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    bodyText1: TextStyle(
      fontSize: Dimen.d_20,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    bodyText2: TextStyle(
      fontSize: Dimen.d_15,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    button: TextStyle(
      fontSize: Dimen.d_18,
      color: AppColors.colorWhite,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    caption: TextStyle(
      fontSize: Dimen.d_12,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    overline: TextStyle(
      fontSize: Dimen.d_10,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.colorAppBlue,
  ),
);*/

//ThemeData darkTheme = ThemeData(
//  primaryColor: const Color(0xFF252525),
//  brightness: Brightness.dark,
//  scaffoldBackgroundColor: const Color(0xFF2C2C2C),
//  accentColor: AppColors.appBlack,
//  dividerColor: AppColors.white,
//  hintColor: AppColors.appBlack,
//  focusColor: AppColors.appBlack,
//  visualDensity: VisualDensity.adaptivePlatformDensity,
//  textTheme: TextTheme(
//    headline5: TextStyle(
//        fontSize: 22.0, color: AppColors.appBlack, height: 1.3),
//    headline4: TextStyle(
//        fontSize: 20.0,
//        fontWeight: FontWeight.w700,
//        color:AppColors.appBlack,
//        height: 1.3),
//    headline3: TextStyle(
//        fontSize: 22.0,
//        fontWeight: FontWeight.w700,
//        color:AppColors.appBlack,
//        height: 1.3),
//    headline2: TextStyle(
//        fontSize: 24.0,
//        fontWeight: FontWeight.w700,
//        color: AppColors.appBlack,
//        height: 1.4),
//    headline1: TextStyle(
//        fontSize: 26.0,
//        fontWeight: FontWeight.w300,
//        color:AppColors.appBlack,
//        height: 1.4),
//    subtitle1: TextStyle(
//        fontSize: 18.0,
//        fontWeight: FontWeight.w500,
//        color:AppColors.appBlack,
//        height: 1.3),
//    headline6: TextStyle(
//        fontSize: 17.0,
//        fontWeight: FontWeight.w700,
//        color: AppColors.appBlack,
//        height: 1.3),
//    bodyText2: TextStyle(
//        fontSize: 14.0,
//        fontWeight: FontWeight.w400,
//        color:AppColors.appBlack,
//        height: 1.2),
//    bodyText1: TextStyle(
//        fontSize: 15.0,
//        fontWeight: FontWeight.w400,
//        color:AppColors.appBlack,
//        height: 1.3),
//    caption: TextStyle(
//        fontSize: 14.0,
//        fontWeight: FontWeight.w300,
//        color:AppColors.appBlack,
//        height: 1.2),
//  ),
//);
