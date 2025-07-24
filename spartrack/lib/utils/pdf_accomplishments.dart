import 'dart:convert';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import '../models/user.dart';
import '../models/attendance_record.dart';
import 'package:intl/intl.dart';

Future<List<int>> generateAccomplishmentsPdf({
  required User user,
  required List<AttendanceRecord> records,
  required double totalHours,
  required String weekLabel,
}) async {
  final pdf = pw.Document();
  // Long bond: 8.5 x 13 inches = 612 x 936 points
  final pageFormat = PdfPageFormat(612, 936);
  final company = user.company;
  final coordinator = user.collegeCoordinator;

  pdf.addPage(
    pw.Page(
      pageFormat: pageFormat,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            // Header
            pw.Table(
              columnWidths: {
                0: pw.FixedColumnWidth(180),
                1: pw.FlexColumnWidth(),
              },
              children: [
                pw.TableRow(children: [
                  pw.Text('Name of Student-Trainee', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(': ${user.fullName}'),
                ]),
                pw.TableRow(children: [
                  pw.Text('Course', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(': ${user.program}'),
                ]),
                pw.TableRow(children: [
                  pw.Text('Name of Company', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(': ${company?.supervisorName ?? ''}'),
                ]),
                pw.TableRow(children: [
                  pw.Text('Department', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(': ${user.ojtDept}'),
                ]),
                pw.TableRow(children: [
                  pw.Text('Company Address', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(': ${company?.companyAddress ?? ''}'),
                ]),
              ],
            ),
            pw.SizedBox(height: 16),
            pw.Center(
              child: pw.Text('RELATED LEARNING EXPERIENCE', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 18)),
            ),
            pw.Center(
              child: pw.Text(weekLabel, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.SizedBox(height: 16),
            // Table
            pw.Table(
              border: pw.TableBorder.all(),
              columnWidths: {
                0: pw.FixedColumnWidth(120),
                1: pw.FlexColumnWidth(),
                2: pw.FixedColumnWidth(80),
              },
              children: [
                pw.TableRow(
                  decoration: pw.BoxDecoration(color: PdfColors.grey300),
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('DATE\nDAY', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('TASKS', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('NO. OF HOURS RENDERED', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                  ],
                ),
                ...records.map((rec) {
                  final dt = DateTime.parse(rec.date);
                  final dateStr = DateFormat('MMMM d, yyyy').format(dt);
                  final dayStr = DateFormat('EEEE').format(dt);
                  final hours = _computeHours(rec);
                  final tasks = _parseTasksPlainText(rec.accomplishmentsDelta);
                  return pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('$dateStr\n$dayStr'),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text(tasks),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text(hours > 0 ? hours.toStringAsFixed(2) : '-'),
                      ),
                    ],
                  );
                }),
                pw.TableRow(
                  decoration: pw.BoxDecoration(color: PdfColors.grey300),
                  children: [
                    pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text('')),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Align(
                        alignment: pw.Alignment.centerRight,
                        child: pw.Text('Total', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('${totalHours.toStringAsFixed(2)} hours', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 16),
            // Footer
            pw.Text('Prepared by:'),
            pw.SizedBox(height: 16),
            pw.Text(user.fullName, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Student-Trainee'),
            pw.SizedBox(height: 24),
            pw.Text('Noted by:'),
            pw.SizedBox(height: 16),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(company?.supervisorName ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline)),
                    pw.Text('Company Supervisor'),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(coordinator?.fullName ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline)),
                    pw.Text(coordinator != null ? coordinator.role : ''),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ),
  );
  return pdf.save();
}

// Helper to parse Quill delta to plain text for PDF
String _parseTasksPlainText(String deltaJson) {
  try {
    final List<dynamic> delta = deltaJson.isNotEmpty ? List<dynamic>.from(jsonDecode(deltaJson)) : [];
    final buffer = StringBuffer();
    for (final op in delta) {
      if (op is Map && op['insert'] != null) {
        buffer.write(op['insert']);
      }
    }
    return buffer.toString();
  } catch (_) {
    return '';
  }
}

// Helper to compute hours for a record
// (You may want to move this logic to a shared utils file)
double _computeHours(AttendanceRecord rec) {
  DateTime? parseTime(String date, String? time) {
    if (time == null) return null;
    try {
      return DateFormat('yyyy-MM-dd hh:mm:ss a').parse('$date $time');
    } catch (_) {
      return null;
    }
  }
  final inTime = parseTime(rec.date, rec.timeIn);
  final outTime = parseTime(rec.date, rec.timeOut);
  if (inTime != null && outTime != null && outTime.isAfter(inTime)) {
    final diff = outTime.difference(inTime);
    return diff.inMinutes / 60.0;
  }
  return 0.0;
} 