import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryRed = Color(0xFFB71C1C); // Main theme red
  static const Color accentRed = Color(0xFFB20000); // Used for headers, highlights
  static const Color successGreen = Color(0xFF00B715); // For success, deployed, etc.
  static const Color dangerRed = Color(0xFFF55B5B); // For errors, time out, etc.
  static const Color infoBlue = Color(0xFF2196F3); // Info, cards, icons
  static const Color infoBlueDark = Color(0xFF1976D2); // Info text
  static const Color orange = Color(0xFFFF9800); // For orange highlights
  static const Color lightBlue = Color(0xFFE3F2FD); // Info card backgrounds
  static const Color fieldGray = Color(0xFFE5E5E5); // Text field backgrounds
  static const Color borderGray = Color(0xFF4A4A4A); // Borders, icons
  static const Color lightGray = Color(0xFFF5F5F5); // General backgrounds
  static const Color darkGray = Color(0xFF757575); // Text, icons
  static const Color shadowLight = Color(0x26000000); // Light shadow
  static const Color shadowDark = Color(0x40000000); // Dark shadow
  static const Color yellowHint = Color(0xFFFFF6BB); // Accomplishments info box
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  
  // Figma Design Colors
  static const Color filterButtonBlue = Color(0xFF007BFF); // Filter button blue from Figma
  static const Color printButtonGreen = Color(0xFF00B715); // Print button green from Figma

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
