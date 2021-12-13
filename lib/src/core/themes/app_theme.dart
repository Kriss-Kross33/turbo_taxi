import 'package:flutter/material.dart';
import 'package:turbo_taxi/src/core/constants/app_color.dart';

class AppTheme {
  AppTheme._();

  static const String fontFamily = 'Bolt';
  static ThemeData get defaultTheme => _lightTheme;

  static ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(elevation: 0),
    textTheme: _lightTextTheme,
    colorScheme: ColorScheme.light(),
  );

  static const _lightTextTheme = TextTheme(
    headline3: _lightHeadline3,
    headline4: _lightHeadline4,
    headline5: _lightHeadline5,
    headline6: _lightHeadline6,
    subtitle1: _lightSubtitle1,
    subtitle2: _lightSubtitle2,
    bodyText2: _lightBodyText2,
    bodyText1: _lightBodyText1,
    button: _lightButtonText,
    caption: _lightCaptionText,
  );

  static const _lightHeadline3 = TextStyle(
    fontSize: 44,
    color: AppColor.acadia,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
  static const _lightHeadline4 = TextStyle(
    fontSize: 28,
    color: AppColor.acadia,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
  static const _lightHeadline5 = TextStyle(
    fontSize: 24,
    color: AppColor.acadia,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
  static const _lightHeadline6 = TextStyle(
    fontSize: 20,
    color: AppColor.acadia,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
  static const _lightSubtitle1 = TextStyle(
    fontSize: 16,
    color: AppColor.acadia,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
  static const _lightSubtitle2 = TextStyle(
    fontSize: 14,
    color: AppColor.acadia,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
  static const _lightBodyText2 = TextStyle(
    fontSize: 14,
    color: AppColor.acadia,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
  static const _lightBodyText1 = TextStyle(
    fontSize: 12,
    color: AppColor.acadia,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
  static const _lightButtonText = TextStyle(
    fontSize: 14,
    color: AppColor.acadia,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  static const _lightCaptionText = TextStyle(
    fontSize: 10,
    color: AppColor.acadia,
    fontStyle: FontStyle.normal,
  );
}
