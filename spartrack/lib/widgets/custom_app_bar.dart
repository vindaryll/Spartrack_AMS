import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final VoidCallback? onMenuPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: leading ?? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/logo_red.png', width: 32, height: 32),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFB20000),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: actions ?? [
        IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF4A4A4A)),
          onPressed: onMenuPressed ?? () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
} 