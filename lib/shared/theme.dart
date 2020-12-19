import 'package:flutter/material.dart';

// ThemeColors

Color appThemeColor01 = Color(0xffe27d60);
Color appThemeColor02 = Color(0xff85dcbf);
Color appThemeColor03 = Color(0xffe8a87c);
Color appThemeColor04 = Color(0xffc38d9e);
Color appThemeColor05 = Color(0xff41b3a3);

Color appThemeColor6 = Color(0xffff1d58);
Color appThemeColor1 = Color(0xfffc4445);
Color appThemeColor2 = Color(0xff3feee6);
Color appThemeColor3 = Color(0xff55bcc9);
Color appThemeColor4 = Color(0xff97caef);
Color appThemeColor5 = Color(0xffcafafe);

ThemeData appTheme = ThemeData(
  primarySwatch: Colors.teal,
  primaryColor: Colors.teal,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryTextTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.black,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontFamily: 'Roboto Slab',
      fontWeight: FontWeight.w700,
    ),
  ),
);
