class DateTimeUtils {
  static String _twoDigits(int n) => n.toString().padLeft(2, '0');

  /// Returns formatted date string (e.g., "Monday 01/15/2024")
  static String getFormattedDate() {
    final now = DateTime.now();
    final weekday = [
      'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'
    ][now.weekday % 7];
    return '$weekday  ${_twoDigits(now.month)}/${_twoDigits(now.day)}/${now.year}';
  }

  /// Returns formatted time string (e.g., "9:30:45 AM")
  static String getFormattedTime() {
    final now = DateTime.now();
    int hour = now.hour;
    final ampm = hour >= 12 ? 'PM' : 'AM';
    if (hour > 12) hour -= 12;
    if (hour == 0) hour = 12;
    final minute = _twoDigits(now.minute);
    final second = _twoDigits(now.second);
    return '$hour:$minute:$second $ampm';
  }
} 