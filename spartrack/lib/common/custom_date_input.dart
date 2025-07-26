import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'custom_text_field.dart';

class CustomDateInput extends StatelessWidget {
  final String label;
  final String? placeholder;
  final TextEditingController controller;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Color? backgroundColor;
  final Function(DateTime)? onDateSelected;
  final bool enabled;

  const CustomDateInput({
    super.key,
    required this.label,
    this.placeholder,
    required this.controller,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.backgroundColor,
    this.onDateSelected,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        GestureDetector(
          onTap: enabled ? () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: initialDate ?? DateTime.now(),
              firstDate: firstDate ?? DateTime(2020),
              lastDate: lastDate ?? DateTime(2100),
            );
            if (picked != null) {
              controller.text = DateFormat('yyyy-MM-dd').format(picked);
              onDateSelected?.call(picked);
            }
          } : null,
          child: AbsorbPointer(
            child: CustomTextField(
              label: label,
              placeholder: placeholder ?? 'Select date',
              controller: controller,
              enabled: false,
              backgroundColor: backgroundColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            Icons.calendar_today, 
            size: 17, 
            color: enabled ? const Color(0xFF4A4A4A) : const Color(0xFF4A4A4A).withValues(alpha: (255 * 0.5).round().toDouble()),
          ),
        ),
      ],
    );
  }
} 