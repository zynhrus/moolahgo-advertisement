import 'package:flutter/material.dart';

/// Classes containing the light theme Color Palette
class ColorLight {
  ColorLight._();

  static const Color ocean = Color(0xFF59C4AF);
  static const Color oceanBlue = Color(0xFF3BA2B9);
  static const Color oceanDisabled = Color(0xFFc5e5df);
  static const Color deepBlue = Color(0xFF003791);
  static const Color red = Color(0xFFFF5959);

  static const Color defaultBlack = Color(0xFF212121);
  static const Color black70 = Color(0xFF232931);
  static const Color black60 = Color(0xFF586371);
  static const Color black50 = Color(0xFFA5AAB0);
  static const Color black40 = Color(0xFFEDF0F4);
  static const Color black30 = Color(0xFFF4F8FC);
  static const Color black20 = Color(0xFFF8F9FB);
  static const Color white = Color(0xffFFFFFF);

  static MaterialColor black = MaterialColor(
    black70.value,
    const <int, Color>{
      100: white,
      200: black20,
      300: black30,
      400: black40,
      500: black50,
      600: black60,
      700: black70,
    },
  );
}
