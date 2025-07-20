import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import '../common/wysiwyg_editor.dart';
import '../common/custom_action_button.dart';
import '../models/user.dart';
import '../utils/app_colors.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import '../models/attendance_record.dart';

class AttendanceTab extends StatefulWidget {
  final User user;

  const AttendanceTab({
    super.key,
    required this.user,
  });

  @override
  State<AttendanceTab> createState() => _AttendanceTabState();
}

class _AttendanceTabState extends State<AttendanceTab> {
  late QuillController _quillController;

  @override
  void initState() {
    super.initState();
    final todayAttendance = _getTodayAttendance();
    if (todayAttendance != null && todayAttendance.accomplishmentsDelta.isNotEmpty) {
      _quillController = QuillController(
        document: Document.fromJson(jsonDecode(todayAttendance.accomplishmentsDelta)),
        selection: const TextSelection.collapsed(offset: 0),
      );
    } else {
      _quillController = QuillController.basic();
    }
  }

  @override
  void dispose() {
    _quillController.dispose();
    super.dispose();
  }

  String _formatTime(String? time) {
    return time ?? '--:--:-- --';
  }

  void _handleTimeIn() {
    // TODO: Implement time in logic
    debugPrint('Time In pressed');
  }

  void _handleTimeOut() {
    // TODO: Implement time out logic
    debugPrint('Time Out pressed');
  }

  void _handleSaveAccomplishments() {
    // Example: Access the document content
    final doc = _quillController.document.toDelta().toJson();
    
    // Handling event; Console log the document content
    debugPrint('Accomplishments saved: $doc');
  }

  AttendanceRecord? _getTodayAttendance() {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return widget.user.attendanceRecords?.firstWhere(
      (rec) => rec.date == today,
      orElse: () => AttendanceRecord(date: today, timeIn: null, timeOut: null, accomplishmentsDelta: ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todayAttendance = _getTodayAttendance();
    return Column(
      children: [
        // Time In/Out Buttons
        Row(
          children: [
            Expanded(
              child: TimeActionButton(
                isTimeIn: true,
                onPressed: _handleTimeIn,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TimeActionButton(
                isTimeIn: false,
                onPressed: _handleTimeOut,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Time In/Out Labels - Left aligned with time values
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time in: ${_formatTime(todayAttendance?.timeIn)}',
                      style: AppColors.captionStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Time out: ${_formatTime(todayAttendance?.timeOut)}',
                      style: AppColors.captionStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Accomplishments Info Box
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.yellowHint,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Row(
            children: [
              const Icon(Icons.lightbulb_outline, size: 18, color: AppColors.black),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Write your tasks/accomplishment below. Accomplishment/task updating is allowed anytime within the day after time-in.',
                  style: AppColors.captionStyle.copyWith(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Accomplishments Rich Text Editor
        Text(
          'Accomplishments for the day',
          style: AppColors.bodyStyle.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.fieldGray,
            border: Border.all(color: AppColors.borderGray, width: 0.5),
            borderRadius: BorderRadius.circular(3),
          ),
          child: WysiwygEditor(
            controller: _quillController,
            height: 180,
          ),
        ),
        const SizedBox(height: 24),
        // Save Accomplishments Button
        SaveButton(
          label: 'Save Accomplishments',
          onPressed: _handleSaveAccomplishments,
        ),
      ],
    );
  }
} 