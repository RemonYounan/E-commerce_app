import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle getAppTextStyle({
    required double size,
    FontWeight weight = FontWeight.normal,
    FontStyle style = FontStyle.normal,
    required Color color,
  }) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
      fontStyle: style,
      // fontFamily: "Jost",
    );
  }
}
