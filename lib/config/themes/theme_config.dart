import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moolahgo/config/themes/light_theme.dart';

/// Enumeration of available themes in the app
///
/// [AppTheme.primaryLight] for Light Theme
/// or [AppTheme.primaryDark] for Dark/Night Theme
enum AppTheme {
  /// Key of light theme apps
  primaryLight,

  /// Key of Dark theme apps
  primaryDark
}

// The array of Theme Data that keep Available themes
final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.primaryLight: ThemeData(
      primaryColor: ColorLight.ocean,
      brightness: Brightness.light,
      primaryColorDark: ColorLight.deepBlue,
      primaryColorLight: ColorLight.oceanBlue,
      selectedRowColor: ColorLight.oceanBlue,
      buttonTheme: const ButtonThemeData(
        buttonColor: ColorLight.ocean,
      ),
      colorScheme: const ColorScheme.light(
          primary: ColorLight.ocean,
          background: ColorLight.oceanDisabled,
          secondary: ColorLight.ocean),
      indicatorColor: ColorLight.black40,
      splashColor: ColorLight.black30,
      errorColor: ColorLight.red,
      disabledColor: ColorLight.oceanDisabled,
      unselectedWidgetColor: ColorLight.black50,
      hintColor: ColorLight.black20,
      dividerColor: ColorLight.black20,
      appBarTheme: const AppBarTheme(
        color: ColorLight.white,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorLight.black70),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          fillColor: ColorLight.ocean,
          focusColor: ColorLight.ocean,
          labelStyle: TextStyle(
              fontSize: 14, fontWeight: regular, color: ColorLight.black70),
          hintStyle: TextStyle(
              fontSize: 14, fontWeight: regular, color: ColorLight.black50),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorLight.black40)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorLight.black40)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorLight.ocean))),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ColorLight.ocean, foregroundColor: ColorLight.white),
      textTheme: GoogleFonts.montserratTextTheme(const TextTheme(
        bodyText1: TextStyle(
            fontSize: 16, fontWeight: regular, color: ColorLight.black60),
        bodyText2: TextStyle(
            fontSize: 14, fontWeight: regular, color: ColorLight.black60),
        subtitle1: TextStyle(
            fontSize: 16, fontWeight: medium, color: ColorLight.black60),
        subtitle2: TextStyle(
            fontSize: 14, fontWeight: medium, color: ColorLight.black60),
        headline1: TextStyle(
            fontSize: 28, fontWeight: bold, color: ColorLight.black70),
        headline2: TextStyle(
            fontSize: 24, fontWeight: bold, color: ColorLight.black70),
        headline3: TextStyle(
            fontSize: 20, fontWeight: bold, color: ColorLight.black70),
        headline4: TextStyle(
            fontSize: 16, fontWeight: bold, color: ColorLight.black70),
        headline5: TextStyle(
            fontSize: 14, fontWeight: bold, color: ColorLight.black70),
        headline6: TextStyle(
            fontSize: 12, fontWeight: bold, color: ColorLight.black70),
      ))),
  // Dark Theme Data that will be used in the future. Still not used.
  AppTheme.primaryDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[700],
  )
};

const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;
const FontWeight extraBold = FontWeight.w800;
const FontWeight black = FontWeight.w900;

const double defaultBorderRadius = 17.0;
const double defaultMargin = 24.0;
