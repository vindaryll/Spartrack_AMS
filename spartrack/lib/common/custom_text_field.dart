// MOVE FILE to lib/common/custom_text_field.dart

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

// A reusable text field widget with label, validation, and password support.
class CustomTextField extends StatefulWidget {
  final String label;
  final String? placeholder;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool enabled;
  final Color? borderColor;
  final Color? backgroundColor;

  const CustomTextField({
    super.key,
    required this.label,
    this.placeholder,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.enabled = true,
    this.borderColor,
    this.backgroundColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      enabled: widget.enabled,
      style: TextStyle(
        color: widget.enabled ? Colors.black : Colors.black.withValues(alpha: (255 * 0.8).round().toDouble()),
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.placeholder,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: widget.backgroundColor != null,
        fillColor: widget.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.primaryRed,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.primaryRed,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.accentRed,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.primaryRed,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }
}

class FloatingLabelTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool enabled;

  const FloatingLabelTextField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.enabled = true,
  });

  @override
  State<FloatingLabelTextField> createState() => _FloatingLabelTextFieldState();
}

class _FloatingLabelTextFieldState extends State<FloatingLabelTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      enabled: widget.enabled,
      decoration: InputDecoration(
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }
}
