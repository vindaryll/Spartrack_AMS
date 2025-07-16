import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomActionButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double borderRadius;
  final bool hasShadow;
  final Color? iconColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;

  const CustomActionButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius = 10,
    this.hasShadow = true,
    this.iconColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.iconSize,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: AppColors.shadowDark,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColors.white,
              size: iconSize ?? 24,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppColors.buttonStyle.copyWith(
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: textColor ?? AppColors.white,
                letterSpacing: 0.07,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Specialized button for Save actions
class SaveButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const SaveButton({
    super.key,
    this.label = 'Save',
    required this.onPressed,
    this.width = 322,
    this.height = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomActionButton(
        backgroundColor: AppColors.successGreen,
        icon: Icons.save_outlined,
        label: label,
        onPressed: onPressed,
        width: width,
        height: height,
        borderRadius: 15,
        fontSize: 18,
        iconSize: 24,
        padding: const EdgeInsets.symmetric(vertical: 4),
      ),
    );
  }
}

// Specialized button for Time In/Out actions
class TimeActionButton extends StatelessWidget {
  final bool isTimeIn;
  final VoidCallback onPressed;

  const TimeActionButton({
    super.key,
    required this.isTimeIn,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomActionButton(
      backgroundColor: isTimeIn 
          ? AppColors.successGreen 
          : AppColors.dangerRed,
      icon: isTimeIn 
          ? Icons.access_time 
          : Icons.access_time_filled,
      label: isTimeIn ? 'TIME IN' : 'TIME OUT',
      onPressed: onPressed,
      height: 40,
    );
  }
} 