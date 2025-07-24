import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomActionButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
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
    final bool isDisabled = onPressed == null;
    final Color effectiveBg = isDisabled
        ? AppColors.fieldGray // Disabled background
        : backgroundColor;
    final Color effectiveIcon = isDisabled
        ? AppColors.darkGray
        : (iconColor ?? AppColors.white);
    final Color effectiveText = isDisabled
        ? AppColors.darkGray
        : (textColor ?? AppColors.white);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: effectiveBg,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: hasShadow && !isDisabled
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
              color: effectiveIcon,
              size: iconSize ?? 24,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppColors.buttonStyle.copyWith(
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: effectiveText,
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
  final VoidCallback? onPressed;

  const TimeActionButton({
    super.key,
    required this.isTimeIn,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;
    final Color effectiveBg = isDisabled
        ? AppColors.fieldGray // Disabled background
        : (isTimeIn ? AppColors.successGreen : AppColors.dangerRed);
    final IconData effectiveIcon = isDisabled
        ? Icons.access_time_outlined // Disabled icon
        : (isTimeIn ? Icons.access_time : Icons.access_time_filled);
    final String effectiveLabel = isDisabled ? 'TIME IN' : (isTimeIn ? 'TIME IN' : 'TIME OUT');
    final Color effectiveText = isDisabled
        ? AppColors.darkGray
        : (isTimeIn ? AppColors.white : AppColors.white);

    return CustomActionButton(
      backgroundColor: effectiveBg,
      icon: effectiveIcon,
      label: effectiveLabel,
      onPressed: onPressed,
      height: 40,
      borderRadius: 10, // Assuming a default borderRadius for TimeActionButton
      hasShadow: true, // Assuming a default hasShadow for TimeActionButton
      iconColor: effectiveText, // Use effectiveText for iconColor
      textColor: effectiveText, // Use effectiveText for textColor
      fontSize: 16, // Assuming a default fontSize for TimeActionButton
      fontWeight: FontWeight.normal, // Assuming a default fontWeight for TimeActionButton
      iconSize: 24, // Assuming a default iconSize for TimeActionButton
      padding: const EdgeInsets.symmetric(vertical: 4), // Assuming a default padding for TimeActionButton
    );
  }
} 