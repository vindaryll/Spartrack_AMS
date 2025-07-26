import 'dart:convert';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import '../models/user.dart';
import '../models/attendance_record.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../utils/time_utils.dart';

Future<List<int>> generateAccomplishmentsPdf({
  required User user,
  required List<AttendanceRecord> records,
  required double totalHours,
  required String weekLabel,
}) async {
  final pdf = pw.Document();
  final pageFormat = PdfPageFormat(612, 936);
  final company = user.company;
  final coordinator = user.collegeCoordinator;

  final ttf = pw.Font.ttf(await rootBundle.load('assets/fonts/NotoSans-Regular.ttf'));
  final ttfBold = pw.Font.ttf(await rootBundle.load('assets/fonts/NotoSans-Medium.ttf'));

  pdf.addPage(
    pw.MultiPage(
      pageFormat: pageFormat,
      margin: const pw.EdgeInsets.all(24),
      build: (pw.Context context) => [
        // Internship Information
        pw.Container(
          padding: const pw.EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.black, width: 1.5),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(height: 4),
              _infoRow('Name of Student-Trainee', user.fullName, ttf, ttfBold),
              _infoRow('Course', user.program, ttf, ttfBold),
              _infoRow('Name of Company', company?.supervisorName ?? '', ttf, ttfBold),
              _infoRow('Department', user.ojtDept, ttf, ttfBold),
              _infoRow('Company Address', company?.companyAddress ?? '', ttf, ttfBold),
              pw.SizedBox(height: 8),
              pw.Center(
                child: pw.Text('RELATED LEARNING EXPERIENCE', style: pw.TextStyle(font: ttfBold, fontWeight: pw.FontWeight.bold, fontSize: 16)),
              ),
              pw.Center(
                child: pw.Text(weekLabel, style: pw.TextStyle(font: ttfBold, fontWeight: pw.FontWeight.bold, fontSize: 12)),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 16),
        // Accomplishments Table
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.black, width: 1.5),
          columnWidths: {
            0: pw.FixedColumnWidth(120),
            1: pw.FlexColumnWidth(),
            2: pw.FixedColumnWidth(80),
          },
          children: [
            pw.TableRow(
              decoration: pw.BoxDecoration(color: PdfColors.grey300),
              children: [
                pw.Container(
                  alignment: pw.Alignment.center,
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text('DATE\nDAY', style: pw.TextStyle(font: ttfBold, fontWeight: pw.FontWeight.bold, fontSize: 11), textAlign: pw.TextAlign.center),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text('TASKS', style: pw.TextStyle(font: ttfBold, fontWeight: pw.FontWeight.bold, fontSize: 11), textAlign: pw.TextAlign.center),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text('NO. OF\nHOURS RENDERED', style: pw.TextStyle(font: ttfBold, fontWeight: pw.FontWeight.bold, fontSize: 11), textAlign: pw.TextAlign.center),
                ),
              ],
            ),
            ...records.map((rec) {
              final dt = DateTime.parse(rec.date);
              final dateStr = DateFormat('MMMM d, yyyy').format(dt);
              final dayStr = DateFormat('EEEE').format(dt);
              final hours = TimeUtils.computeHours(rec);
              final tasksWidgets = _parseTasksPdf(rec.accomplishmentsDelta, ttf);
              return pw.TableRow(
                children: [
                  pw.Container(
                    alignment: pw.Alignment.centerLeft,
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text('$dateStr\n$dayStr', style: pw.TextStyle(font: ttf, fontSize: 10)),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.topLeft,
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: tasksWidgets,
                    ),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text(hours > 0 ? hours.toStringAsFixed(2) : '-', style: pw.TextStyle(font: ttf, fontSize: 10)),
                  ),
                ],
              );
            }),
            // Total row
            pw.TableRow(
              decoration: pw.BoxDecoration(color: PdfColors.grey300),
              children: [
                pw.Container(padding: const pw.EdgeInsets.all(8), child: pw.Text('', style: pw.TextStyle(font: ttf))),
                pw.Container(
                  alignment: pw.Alignment.centerRight,
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text('Total', style: pw.TextStyle(font: ttfBold, fontWeight: pw.FontWeight.bold, fontSize: 11)),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text('${totalHours.toStringAsFixed(2)} hours', style: pw.TextStyle(font: ttfBold, fontWeight: pw.FontWeight.bold, fontSize: 11)),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 24),
        // Prepared by / Noted by section
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Prepared by:', style: pw.TextStyle(font: ttf, fontSize: 10)),
                pw.SizedBox(height: 24),
                pw.Text(user.fullName, style: pw.TextStyle(font: ttfBold, fontWeight: pw.FontWeight.bold, fontSize: 10)),
                pw.Text('Student-Trainee', style: pw.TextStyle(font: ttf, fontSize: 10)),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Noted by:', style: pw.TextStyle(font: ttf, fontSize: 10)),
                pw.SizedBox(height: 24),
                pw.Text(company?.supervisorName ?? '', style: pw.TextStyle(font: ttfBold, fontWeight: pw.FontWeight.bold, fontSize: 10, decoration: pw.TextDecoration.underline)),
                pw.Text('Company Supervisor', style: pw.TextStyle(font: ttf, fontSize: 10)),
                pw.SizedBox(height: 12),
                pw.Text(coordinator?.fullName ?? '', style: pw.TextStyle(font: ttfBold, fontWeight: pw.FontWeight.bold, fontSize: 10, decoration: pw.TextDecoration.underline)),
                pw.Text(coordinator != null ? coordinator.role : '', style: pw.TextStyle(font: ttf, fontSize: 10)),
              ],
            ),
          ],
        ),
      ],
    ),
  );
  return pdf.save();
}

pw.Widget _infoRow(String label, String value, pw.Font ttf, pw.Font ttfBold) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(vertical: 1),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: 140,
          child: pw.Text(label, style: pw.TextStyle(font: ttfBold, fontWeight: pw.FontWeight.bold, fontSize: 10)),
        ),
        pw.Text(': ', style: pw.TextStyle(font: ttfBold, fontWeight: pw.FontWeight.bold, fontSize: 10)),
        pw.Expanded(
          child: pw.Text(value, style: pw.TextStyle(font: ttf, fontSize: 10)),
        ),
      ],
    ),
  );
}

// Add this function to parse Quill delta for PDF rendering
List<pw.Widget> _parseTasksPdf(String deltaJson, pw.Font ttf) {
  try {
    final List<dynamic> delta = deltaJson.isNotEmpty ? List<dynamic>.from(jsonDecode(deltaJson)) : [];
    final List<pw.Widget> widgets = [];
    // Helper for roman numerals
    String toRoman(int number) {
      if (number < 1) return '';
      final numerals = [
        ['M', 1000], ['CM', 900], ['D', 500], ['CD', 400],
        ['C', 100], ['XC', 90], ['L', 50], ['XL', 40],
        ['X', 10], ['IX', 9], ['V', 5], ['IV', 4], ['I', 1]
      ];
      var result = '';
      var n = number;
      for (final pair in numerals) {
        final String numeral = pair[0] as String;
        final int value = pair[1] as int;
        while (n >= value) {
          result += numeral;
          n -= value;
        }
      }
      return result.toLowerCase();
    }
    String getOrderedMarker(int indent, int count) {
      switch (indent % 5) {
        case 0:
          return '$count.';
        case 1:
          return '${String.fromCharCode(96 + count)}.';
        case 2:
          return '${toRoman(count)}.';
        case 3:
          return '${String.fromCharCode(64 + count)}.';
        case 4:
          return '${toRoman(count).toUpperCase()}.';
        default:
          return '$count.';
      }
    }
    // Group delta into lines with block attributes
    List<Map<String, dynamic>> lines = [];
    List<String> lineBuffer = [];
    Map<String, dynamic>? blockAttrs;
    void flushLine() {
      if (lineBuffer.isEmpty) return;
      lines.add({
        'text': lineBuffer.join(),
        'attrs': blockAttrs != null ? Map<String, dynamic>.from(blockAttrs!) : null,
      });
      lineBuffer = [];
      blockAttrs = null;
    }
    int i = 0;
    while (i < delta.length) {
      final op = delta[i];
      if (op is! Map || op['insert'] == null) {
        i++;
        continue;
      }
      final text = op['insert'].toString();
      Map<String, dynamic>? attrs;
      if (op['attributes'] != null) {
        attrs = Map<String, dynamic>.from(op['attributes']);
      }
      if (text == '\n') {
        blockAttrs = attrs;
        flushLine();
      } else if (text.contains('\n')) {
        final parts = text.split('\n');
        for (int j = 0; j < parts.length; j++) {
          if (parts[j].isNotEmpty) {
            lineBuffer.add(parts[j]);
          }
          if (j < parts.length - 1) {
            blockAttrs = attrs;
            flushLine();
          }
        }
      } else {
        lineBuffer.add(text);
      }
      i++;
    }
    flushLine();
    // Group lines into nested lists
    List<pw.Widget> buildLines(List<Map<String, dynamic>> lines, int start, int indent, String? parentListType, List<int> orderedCounts) {
      List<pw.Widget> result = [];
      int i = start;
      while (i < lines.length) {
        final attrs = lines[i]['attrs'] as Map<String, dynamic>?;
        final lineIndent = attrs?['indent'] ?? 0;
        final listType = attrs?['list'];
        if (listType != null && lineIndent > indent) {
          // Nested list
          final nested = buildLines(lines, i, lineIndent, listType, [...orderedCounts]);
          result.add(pw.Padding(
            padding: pw.EdgeInsets.only(left: 12.0 * lineIndent),
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: nested),
          ));
          int skip = nested.length;
          i += skip;
          continue;
        }
        if (listType != null && lineIndent == indent) {
          // List item
          pw.Widget bullet;
          if (listType == 'bullet') {
            bullet = pw.Text('•', style: pw.TextStyle(font: ttf, fontSize: 10));
          } else if (listType == 'ordered') {
            int count = 1;
            if (orderedCounts.length > indent) {
              count = ++orderedCounts[indent];
            } else {
              orderedCounts.add(1);
              count = 1;
            }
            String label = getOrderedMarker(indent, count);
            bullet = pw.Text(label, style: pw.TextStyle(font: ttf, fontSize: 10));
          } else if (listType == 'checked' || listType == 'unchecked') {
            bullet = pw.Text(attrs?['list'] == 'checked' ? '[v]' : '[ ]', style: pw.TextStyle(font: ttf, fontSize: 10));
          } else {
            bullet = pw.SizedBox(width: 0);
          }
          result.add(pw.Padding(
            padding: pw.EdgeInsets.only(left: 12.0 * indent, bottom: 2),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                bullet,
                pw.SizedBox(width: 4),
                pw.Expanded(
                  child: pw.Text(lines[i]['text'] ?? '', style: pw.TextStyle(font: ttf, fontSize: 10)),
                ),
              ],
            ),
          ));
          i++;
          continue;
        }
        // Not a list item
        if (lineIndent > indent) {
          // Nested non-list block
          final nested = buildLines(lines, i, lineIndent, null, [...orderedCounts]);
          result.add(pw.Padding(
            padding: pw.EdgeInsets.only(left: 12.0 * lineIndent),
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: nested),
          ));
          int skip = nested.length;
          i += skip;
          continue;
        }
        // Normal paragraph
        result.add(pw.Padding(
          padding: pw.EdgeInsets.only(left: 12.0 * lineIndent, bottom: 2),
          child: pw.Text(lines[i]['text'] ?? '', style: pw.TextStyle(font: ttf, fontSize: 10)),
        ));
        i++;
      }
      return result;
    }
    widgets.addAll(buildLines(lines, 0, 0, null, []));
    return widgets;
  } catch (e) {
    return [pw.Text('Error parsing tasks: ${e.toString()}', style: pw.TextStyle(font: ttf, fontSize: 10))];
  }
} 