import 'package:intl/intl.dart';
import '../models/attendance_record.dart';

class TimeUtils {
  /// Parse time string (e.g., '09:30:00 AM') to DateTime
  static DateTime? parseTime(String date, String? time) {
    if (time == null) return null;
    try {
      // Combine date and time, parse with DateFormat
      return DateFormat('yyyy-MM-dd hh:mm:ss a').parse('$date $time');
    } catch (_) {
      return null;
    }
  }

  /// Compute hours for a single attendance record
  static double computeHours(AttendanceRecord rec) {
    final inTime = parseTime(rec.date, rec.timeIn);
    final outTime = parseTime(rec.date, rec.timeOut);
    if (inTime != null && outTime != null && outTime.isAfter(inTime)) {
      final diff = outTime.difference(inTime);
      return diff.inMinutes / 60.0;
    }
    return 0.0;
  }

  /// Compute total hours for a list of attendance records
  static double computeTotalHours(List<AttendanceRecord> records) {
    return records.fold(0.0, (sum, rec) => sum + computeHours(rec));
  }

  /// Calculate completed hours from attendance records (handles nullable list)
  static double calculateCompletedHours(List<AttendanceRecord>? records) {
    if (records == null) return 0.0;
    return computeTotalHours(records);
  }

  /// Format time string for display
  static String formatTime(String? time) {
    return time ?? '--:--:-- --';
  }

  /// Get current date in yyyy-MM-dd format
  static String getCurrentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  /// Get current time in hh:mm:ss a format
  static String getCurrentTime() {
    return DateFormat('hh:mm:ss a').format(DateTime.now());
  }
} 