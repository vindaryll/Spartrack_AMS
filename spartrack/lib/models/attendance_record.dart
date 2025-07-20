import 'dart:convert';

class AttendanceRecord {
  final String date; // e.g. '2024-07-01'
  final String? timeIn; // e.g. '09:00 AM'
  final String? timeOut; // e.g. '05:00 PM'
  /// Quill Delta JSON string. Can be any rich content: bullets, checklists, headings, etc.
  final String accomplishmentsDelta;

  AttendanceRecord({
    required this.date,
    this.timeIn,
    this.timeOut,
    required this.accomplishmentsDelta,
  });

  // Helper: Convert a List<String> to a Quill bullet list Delta JSON string
  static String bulletsToDelta(List<String> bullets) {
    final delta = <Map<String, dynamic>>[];
    for (final bullet in bullets) {
      delta.add({"insert": bullet});
      delta.add({"attributes": {"list": "bullet"}, "insert": "\n"});
    }
    return jsonEncode(delta);
  }

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

  /// Example: Returns a Quill Delta JSON string matching a rich editor (checklist, heading, ordered, bullet, normal)
  static String sampleDelta() {
    final delta = [
      {"insert": "hsadf"},
      {"attributes": {"header": 2, "checked": true}, "insert": "\n"},
      {"insert": "SDFSDF"},
      {"attributes": {"list": "ordered"}, "insert": "\n"},
      {"insert": "sdf"},
      {"attributes": {"list": "bullet"}, "insert": "\n"},
      {"insert": "sdfsdf\n"}
    ];
    return jsonEncode(delta);
  }
} 