import 'package:flutter/material.dart';

class BrandAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? leading;
  final Color backgroundColor;

  const BrandAppBar({
    super.key,
    this.actions,
    this.leading,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: Color(0xFF4A4A4A)),
      leading: leading,
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo_red.png',
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          const Text(
            'SparTrack',
            style: TextStyle(
              color: Color(0xFFB20000),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
} 