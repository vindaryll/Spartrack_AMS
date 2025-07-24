import 'dart:convert';

class AttendanceRecord {
  final String date;
  final String? timeIn;
  final String? timeOut;

  /// Quill Delta JSON string. Can be any rich content: bullets, checklists, headings, etc.
  final String accomplishmentsDelta;

  AttendanceRecord({
    required this.date,
    this.timeIn,
    this.timeOut,
    required this.accomplishmentsDelta,
  });

  // Helper: Create a rich Quill Delta JSON string with formatting
  static String richDelta(List<Map<String, dynamic>> items) {
    final delta = <Map<String, dynamic>>[];
    for (final item in items) {
      final text = item['text'] ?? '';
      final attributes = <String, dynamic>{};
      if (item['bold'] == true) attributes['bold'] = true;
      if (item['italic'] == true) attributes['italic'] = true;
      if (item['underline'] == true) attributes['underline'] = true;
      if (item['indent'] != null) attributes['indent'] = item['indent'];
      if (item['header'] != null) attributes['header'] = item['header'];
      if (item['checked'] != null) attributes['checked'] = item['checked'];
      if (item['list'] != null) attributes['list'] = item['list'];
      delta.add({"insert": text});
      if (attributes.isNotEmpty) {
        delta.add({"attributes": attributes, "insert": "\n"});
      } else {
        delta.add({"insert": "\n"});
      }
    }
    return jsonEncode(delta);
  }

} 