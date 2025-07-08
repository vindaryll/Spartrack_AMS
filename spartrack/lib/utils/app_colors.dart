import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryRed = Color(0xFFB71C1C);
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color darkGray = Color(0xFF757575);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // Poppins Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: black,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: black,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: black,
  );

  static const TextStyle captionStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: darkGray,
  );

  static const TextStyle buttonStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white,
  );
}
