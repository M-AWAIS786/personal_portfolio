import 'package:flutter/material.dart';
class AppTextStyles {
  static TextStyle headerTextStyle({Color color = Colors.white}) {
    return TextStyle(
      fontFamily: 'Signika Negative',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle montserratStyle(
      {required Color color, double fontSize = 24}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: fontSize,
    );
  }

  static TextStyle headingStyles(
      {double fontSize = 36, Color color = Colors.white}) {
    return TextStyle(
      fontFamily: 'Rubik Moonrocks',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      letterSpacing: 2,
    );
  }

  static TextStyle normalStyle(
      {Color color = Colors.white, double fontSize = 16}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: color,
      letterSpacing: 1.7,
      height: 1.5,
    );
  }

  static TextStyle comfortaaStyle({
    double fontSize = 18.0,
    FontWeight fontWeight = FontWeight.w800,
    Color color = Colors.grey,
  }) {
    return TextStyle(
      fontFamily: 'Comfortaa',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
