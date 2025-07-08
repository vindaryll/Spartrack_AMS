import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final bool isWhite;
  final double size;

  const LogoWidget({
    super.key,
    this.isWhite = false,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isWhite ? 'assets/images/logo_white.png' : 'assets/images/logo_red.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
