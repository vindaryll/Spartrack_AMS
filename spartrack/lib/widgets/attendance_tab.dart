import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import '../common/wysiwyg_editor.dart';
import '../common/custom_buttons.dart';
import '../models/user.dart';
import '../utils/app_colors.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import '../models/attendance_record.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

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

  void _handleTimeIn() async {
    final now = DateTime.now(); 
    final result = await ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.question,
        title: "Time In",
        text: "Are you sure you want to time in?",
        showCancelBtn: true,
        confirmButtonText: "Confirm",
        cancelButtonText: "Cancel",
      ),
    );
    if (result != null && result.isTapConfirmButton) {
      final today = DateFormat('yyyy-MM-dd').format(now);
      final timeStr = DateFormat('hh:mm:ss a').format(now);
      if (!mounted) return;
      setState(() {
        AttendanceRecord? todayRec = widget.user.attendanceRecords?.firstWhere(
          (rec) => rec.date == today,
          orElse: () => AttendanceRecord(date: today, timeIn: null, timeOut: null, accomplishmentsDelta: ''),
        );
        if (todayRec == null) {
          todayRec = AttendanceRecord(date: today, timeIn: timeStr, timeOut: null, accomplishmentsDelta: '');
          widget.user.attendanceRecords?.add(todayRec);
        } else {
          // Update timeIn if not set
          if (todayRec.timeIn == null || todayRec.timeIn!.isEmpty) {
            todayRec.timeIn = timeStr;
          }
        }
      });
      
      // Show success SweetAlert
      if (!mounted) return;
      ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.success,
          title: "Time In Successful!",
          text: 'You have successfully timed in at $timeStr',
        ),
      );
    }
  }

  void _handleTimeOut() async {
    final now = DateTime.now(); 
    final result = await ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.question,
        title: "Time Out",
        text: "Are you sure you want to time out?",
        showCancelBtn: true,
        confirmButtonText: "Confirm",
        cancelButtonText: "Cancel",
      ),
    );
    if (result != null && result.isTapConfirmButton) {
      final today = DateFormat('yyyy-MM-dd').format(now);
      final timeStr = DateFormat('hh:mm:ss a').format(now);
      if (!mounted) return;
      setState(() {
        AttendanceRecord? todayRec = widget.user.attendanceRecords?.firstWhere(
          (rec) => rec.date == today,
          orElse: () => AttendanceRecord(date: today, timeIn: null, timeOut: null, accomplishmentsDelta: ''),
        );
        if (todayRec != null) {
          todayRec.timeOut = timeStr;
        }
      });
      
      // Show success SweetAlert
      if (!mounted) return;
      ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.success,
          title: "Time Out Successful!",
          text: 'You have successfully timed out at $timeStr',
        ),
      );
    }
  }

  void _handleSaveAccomplishments() {
    final doc = _quillController.document.toDelta().toJson();
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    setState(() {
      AttendanceRecord? todayRec = widget.user.attendanceRecords?.firstWhere(
        (rec) => rec.date == today,
        orElse: () => AttendanceRecord(date: today, timeIn: null, timeOut: null, accomplishmentsDelta: ''),
      );
      if (todayRec != null) {
        todayRec.accomplishmentsDelta = jsonEncode(doc);
      }
    });
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
    final hasTimeIn = todayAttendance?.timeIn != null && todayAttendance!.timeIn!.isNotEmpty;
    final hasTimeOut = todayAttendance?.timeOut != null && todayAttendance!.timeOut!.isNotEmpty;
    // Re-initialize the QuillController with the latest accomplishmentsDelta
    if (todayAttendance != null && todayAttendance.accomplishmentsDelta.isNotEmpty) {
      _quillController = QuillController(
        document: Document.fromJson(jsonDecode(todayAttendance.accomplishmentsDelta)),
        selection: const TextSelection.collapsed(offset: 0),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Time In/Out Buttons
        Row(
          children: [
            Expanded(
              child: TimeActionButton(
                isTimeIn: true,
                key: const Key('timeInBtn'),
                onPressed: (!hasTimeIn && !hasTimeOut) ? _handleTimeIn : null,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TimeActionButton(
                isTimeIn: false,
                onPressed: (hasTimeIn && !hasTimeOut) ? _handleTimeOut : null,
                key: const Key('timeOutBtn'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Time In/Out Labels - Left aligned with time values
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                    const SizedBox(height: 12),
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
        const SizedBox(height: 20),
        // Accomplishments Info Box
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.yellowHint,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Row(
            children: [
              const Icon(Icons.lightbulb_outline, size: 20, color: AppColors.black),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Write your tasks/accomplishment below. Accomplishment/task updating is allowed anytime within the day after time-in.',
                  style: AppColors.captionStyle.copyWith(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Accomplishments Rich Text Editor
        Text(
          'Accomplishments for the day',
          style: AppColors.bodyStyle.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 12),
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
        const SizedBox(height: 32),
        // Save Accomplishments Button
        SaveButton(
          label: 'Save Accomplishments',
          onPressed: () async {
            try {
              _handleSaveAccomplishments();
              if (context.mounted) {
                ArtSweetAlert.show(
                  context: context,
                  artDialogArgs: ArtDialogArgs(
                    type: ArtSweetAlertType.success,
                    title: 'Saved!',
                    text: 'Accomplishments for the day have been saved successfully.',
                  ),
                );
              }
            } catch (e) {
              if (context.mounted) {
                ArtSweetAlert.show(
                  context: context,
                  artDialogArgs: ArtDialogArgs(
                    type: ArtSweetAlertType.danger,
                    title: 'Save Failed',
                    text: 'An error occurred while saving accomplishments: $e',
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }
} 