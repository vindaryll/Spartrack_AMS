import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import '../utils/app_colors.dart';
import '../models/user.dart';
import '../models/attendance_record.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:printing/printing.dart';
import '../utils/pdf_accomplishments.dart';
import 'dart:typed_data';
import 'package:art_sweetalert/art_sweetalert.dart';
import '../common/custom_text_field.dart';

class AccomplishmentsTab extends StatefulWidget {
  final User? user;
  const AccomplishmentsTab({super.key, this.user});

  @override
  State<AccomplishmentsTab> createState() => _AccomplishmentsTabState();
}

class _AccomplishmentsTabState extends State<AccomplishmentsTab> {
  DateTime? _fromDate;
  DateTime? _toDate;
  String _week = '';
  List<AttendanceRecord> _filteredRecords = [];

  @override
  void initState() {
    super.initState();
    _applyFilter();
  }

  void _applyFilter() {
    final records = widget.user?.attendanceRecords ?? [];

    setState(() {
      _filteredRecords = records.where((rec) {
        final recDate = DateTime.parse(rec.date);
        // If both dates are set and from > to, treat as no filter
        if (_fromDate != null && _toDate != null && _fromDate!.isAfter(_toDate!)) return true;
        if (_fromDate != null && recDate.isBefore(_fromDate!)) return false;
        if (_toDate != null && recDate.isAfter(_toDate!)) return false;
        return true;
      }).toList();
      _filteredRecords.sort((a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));
    });
  }

  Future<void> _showFilterModal() async {
    await showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (context) {
        DateTime? tempFrom = _fromDate;
        DateTime? tempTo = _toDate;
        String tempWeek = _week;
        final weekController = TextEditingController(text: tempWeek);
        final fromController = TextEditingController(text: tempFrom != null ? DateFormat('yyyy-MM-dd').format(tempFrom) : '');
        final toController = TextEditingController(text: tempTo != null ? DateFormat('yyyy-MM-dd').format(tempTo) : '');
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(24),
          child: Container(
            width: 284,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF4A4A4A), width: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  height: 31,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB20000),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    border: Border(
                      bottom: BorderSide(color: Color(0xFF4A4A4A), width: 0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Filter Options',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white,
                            letterSpacing: 0.07,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white, size: 20),
                        onPressed: () => Navigator.pop(context),
                        splashRadius: 18,
                        padding: const EdgeInsets.only(right: 8),
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  child: StatefulBuilder(
                    builder: (context, setModalState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // From
                          Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate: tempFrom ?? DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2100),
                                  );
                                  if (picked != null) {
                                    setModalState(() {
                                      tempFrom = picked;
                                      fromController.text = DateFormat('yyyy-MM-dd').format(picked);
                                    });
                                  }
                                },
                                child: AbsorbPointer(
                                  child: CustomTextField(
                                    label: 'From:',
                                    placeholder: 'Select date',
                                    controller: fromController,
                                    enabled: false,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.calendar_today, size: 17, color: Color(0xFF4A4A4A)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // To
                          Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate: tempTo ?? DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2100),
                                  );
                                  if (picked != null) {
                                    setModalState(() {
                                      tempTo = picked;
                                      toController.text = DateFormat('yyyy-MM-dd').format(picked);
                                    });
                                  }
                                },
                                child: AbsorbPointer(
                                  child: CustomTextField(
                                    label: 'To:',
                                    placeholder: 'Select date',
                                    controller: toController,
                                    enabled: false,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.calendar_today, size: 17, color: Color(0xFF4A4A4A)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Week
                          CustomTextField(
                            label: 'Week:',
                            placeholder: 'e.g: 4',
                            controller: weekController,
                            onChanged: (val) => tempWeek = val,
                            enabled: true,
                          ),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF6C757D),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    elevation: 2,
                                    minimumSize: const Size(0, 36),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      tempFrom = null;
                                      tempTo = null;
                                      tempWeek = '';
                                      _fromDate = null;
                                      _toDate = null;
                                      _week = '';
                                    });
                                    Navigator.pop(context);
                                    _applyFilter();
                                  },
                                  child: const Text('Clear', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 12, letterSpacing: 0.07)),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF007BFF),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    elevation: 2,
                                    minimumSize: const Size(0, 36),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _fromDate = tempFrom;
                                      _toDate = tempTo;
                                      _week = weekController.text.trim();
                                    });
                                    Navigator.pop(context);
                                    _applyFilter();
                                  },
                                  child: const Text('Apply', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 12, letterSpacing: 0.07)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper to parse time string (e.g., '09:30:00 AM') to DateTime
  DateTime? _parseTime(String date, String? time) {
    if (time == null) return null;
    try {
      // Combine date and time, parse with DateFormat
      return DateFormat('yyyy-MM-dd hh:mm:ss a').parse('$date $time');
    } catch (_) {
      return null;
    }
  }

  // Compute hours for a single record
  double _computeHours(AttendanceRecord rec) {
    final inTime = _parseTime(rec.date, rec.timeIn);
    final outTime = _parseTime(rec.date, rec.timeOut);
    if (inTime != null && outTime != null && outTime.isAfter(inTime)) {
      final diff = outTime.difference(inTime);
      return diff.inMinutes / 60.0;
    }
    return 0.0;
  }

  double _computeTotalHours() {
    return _filteredRecords.fold(0.0, (sum, rec) => sum + _computeHours(rec));
  }

  Widget _buildPreview() {
    final user = widget.user;
    if (user == null) return const SizedBox.shrink();
    final company = user.company;
    final coordinator = user.collegeCoordinator;
    final records = _filteredRecords;
    final totalHours = _computeTotalHours();
    final weekLabel = _week.isNotEmpty ? _week : '_';
    const double previewWidth = 900;
    return Center(
      child: Container(
        color: AppColors.white,
        width: previewWidth,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Table(
                  columnWidths: const {
                    0: FixedColumnWidth(220),
                    1: FlexColumnWidth(),
                  },
                  children: [
                    TableRow(children: [
                      const Text('Name of Student-Trainee', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(': ${user.fullName}'),
                    ]),
                    TableRow(children: [
                      const Text('Course', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(': ${user.program}'),
                    ]),
                    TableRow(children: [
                      const Text('Name of Company', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(': ${company?.supervisorName ?? ''}'),
                    ]),
                    TableRow(children: [
                      const Text('Department', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(': ${user.ojtDept}'),
                    ]),
                    TableRow(children: [
                      const Text('Company Address', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(': ${company?.companyAddress ?? ''}'),
                    ]),
                  ],
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'RELATED LEARNING EXPERIENCE',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                // put the week number here
                Center(
                  child: Text('Week $weekLabel', style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                if (records.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Center(
                      child: Text('No records found for the selected filter.', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ),
                  ),
                // Table (scrollable horizontally only)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: previewWidth),
                    child: Table(
                      border: TableBorder.all(color: AppColors.black, width: 1),
                      columnWidths: const {
                        0: FixedColumnWidth(180),
                        1: FlexColumnWidth(),
                        2: FixedColumnWidth(120),
                      },
                      children: [
                        TableRow(
                          decoration: const BoxDecoration(color: AppColors.lightGray),
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('DATE\nDAY', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('TASKS', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('NO. OF HOURS RENDERED', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        ...records.map((rec) {
                          final dt = DateTime.parse(rec.date);
                          final dateStr = DateFormat('MMMM d, yyyy').format(dt);
                          final dayStr = DateFormat('EEEE').format(dt);
                          final hours = _computeHours(rec);
                          return TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text('$dateStr\n$dayStr'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: _parseTasksRich(rec.accomplishmentsDelta),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(hours > 0 ? hours.toStringAsFixed(2) : '-', style: const TextStyle()),
                              ),
                            ],
                          );
                        }),
                        TableRow(
                          decoration: const BoxDecoration(color: AppColors.lightGray),
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(''),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text('${totalHours.toStringAsFixed(2)} hours', style: const TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Footer
                const Text('Prepared by:'),
                const SizedBox(height: 16),
                Text(user.fullName, style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text('Student-Trainee'),
                const SizedBox(height: 24),
                const Text('Noted by:'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(company?.supervisorName ?? '', style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                        const Text('Company Supervisor'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(coordinator?.fullName ?? '', style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                        Text(coordinator != null ? coordinator.role : ''),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _parseTasksRich(String deltaJson) {
    try {
      final List<dynamic> delta = deltaJson.isNotEmpty ? List<dynamic>.from(jsonDecode(deltaJson)) : [];
      final List<Widget> widgets = [];
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
      // Helper for ordered list markers per Quill convention
      String getOrderedMarker(int indent, int count) {
        switch (indent % 5) {
          case 0:
            return '$count. ';
          case 1:
            // a., b., c., ...
            return '${String.fromCharCode(96 + count)}. ';
          case 2:
            // i., ii., iii., ...
            return '${toRoman(count)}. ';
          case 3:
            // A., B., C., ...
            return '${String.fromCharCode(64 + count)}. ';
          case 4:
            // I., II., III., ...
            return '${toRoman(count).toUpperCase()}. ';
          default:
            return '$count. ';
        }
      }
      // Custom checklist box (text-based)
      Widget checklistBox(bool checked) {
        return Padding(
          padding: const EdgeInsets.only(right: 6, top: 2),
          child: Text(
            checked ? '[✓]' : '[ ]',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              letterSpacing: 1.5,
            ),
          ),
        );
      }
      // Group delta into lines with block attributes
      List<Map<String, dynamic>> lines = [];
      List<InlineSpan> lineBuffer = [];
      Map<String, dynamic>? blockAttrs;
      void flushLine() {
        if (lineBuffer.isEmpty) return;
        lines.add({
          'spans': List<InlineSpan>.from(lineBuffer),
          'attrs': blockAttrs != null ? Map<String, dynamic>.from(blockAttrs!) : null,
        });
        lineBuffer = [];
        blockAttrs = null;
      }
      InlineSpan parseInline(String txt, Map<String, dynamic>? attrs) {
        TextStyle style = const TextStyle();
        if (attrs != null) {
          if (attrs['bold'] == true) style = style.merge(const TextStyle(fontWeight: FontWeight.bold));
          if (attrs['italic'] == true) style = style.merge(const TextStyle(fontStyle: FontStyle.italic));
          if (attrs['underline'] == true) style = style.merge(const TextStyle(decoration: TextDecoration.underline));
          if (attrs['strike'] == true) style = style.merge(const TextStyle(decoration: TextDecoration.lineThrough));
          if (attrs['code'] == true) style = style.merge(const TextStyle(fontFamily: 'monospace', backgroundColor: Color(0xFFE0E0E0)));
          if (attrs['link'] != null) {
            style = style.merge(const TextStyle(color: Colors.blue, decoration: TextDecoration.underline));
          }
        }
        // Subscript/Superscript
        if (attrs != null && attrs['script'] != null) {
          if (attrs['script'] == 'sub') {
            style = style.merge(const TextStyle(fontSize: 12));
            return WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: Transform.translate(
                offset: const Offset(0, 4),
                child: Text(txt, style: style),
              ),
            );
          } else if (attrs['script'] == 'super') {
            style = style.merge(const TextStyle(fontSize: 12));
            return WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: Transform.translate(
                offset: const Offset(0, -8),
                child: Text(txt, style: style),
              ),
            );
          }
        }
        if (attrs != null && attrs['link'] != null) {
          return TextSpan(
            text: txt,
            style: style,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                final url = attrs['link'];
                if (url != null) {
                  launchUrl(Uri.parse(url));
                }
              },
          );
        }
        return TextSpan(text: txt, style: style);
      }
      // Parse delta into lines
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
              lineBuffer.add(parseInline(parts[j], attrs));
            }
            if (j < parts.length - 1) {
              blockAttrs = attrs;
              flushLine();
            }
          }
        } else {
          lineBuffer.add(parseInline(text, attrs));
        }
        i++;
      }
      flushLine();
      // Group lines into nested lists
      List<Widget> buildLines(List<Map<String, dynamic>> lines, int start, int indent, String? parentListType, List<int> orderedCounts) {
        List<Widget> result = [];
        int i = start;
        while (i < lines.length) {
          final attrs = lines[i]['attrs'] as Map<String, dynamic>?;
          final lineIndent = attrs?['indent'] ?? 0;
          final listType = attrs?['list'];
          if (listType != null && lineIndent > indent) {
            // Nested list
            final nested = buildLines(lines, i, lineIndent, listType, [...orderedCounts]);
            result.add(Padding(
              padding: EdgeInsets.only(left: 24.0 * lineIndent),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: nested),
            ));
            // Skip nested lines
            int skip = nested.length;
            i += skip;
            continue;
          }
          if (listType != null && lineIndent == indent) {
            // List item
            Widget bullet;
            if (listType == 'bullet') {
              bullet = const Text('• ', style: TextStyle(fontWeight: FontWeight.bold));
            } else if (listType == 'ordered') {
              int count = 1;
              if (orderedCounts.length > indent) {
                count = ++orderedCounts[indent];
              } else {
                orderedCounts.add(1);
                count = 1;
              }
              String label = getOrderedMarker(indent, count);
              bullet = Text(label, style: const TextStyle(fontWeight: FontWeight.bold));
            } else if (listType == 'checked' || listType == 'unchecked') {
              bullet = checklistBox(attrs?['list'] == 'checked');
            } else {
              bullet = const SizedBox(width: 0);
            }
            result.add(Padding(
              padding: EdgeInsets.only(left: 24.0 * indent),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bullet,
                  Expanded(
                    child: RichText(
                      text: TextSpan(children: lines[i]['spans'], style: const TextStyle(color: Colors.black, fontSize: 14)),
                    ),
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
            result.add(Padding(
              padding: EdgeInsets.only(left: 24.0 * lineIndent),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: nested),
            ));
            int skip = nested.length;
            i += skip;
            continue;
          }
          // Block types
          if (attrs != null && attrs['header'] != null) {
            result.add(Padding(
              padding: EdgeInsets.only(left: 24.0 * lineIndent),
              child: RichText(
                text: TextSpan(
                  children: lines[i]['spans'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (18 + 2 * (3 - (attrs['header'] is int ? attrs['header'] as int : 3))).toDouble(),
                    color: Colors.black,
                  ),
                ),
              ),
            ));
            i++;
            continue;
          }
          if (attrs != null && attrs['blockquote'] == true) {
            result.add(Padding(
              padding: EdgeInsets.only(left: 24.0 * lineIndent),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  border: Border(left: BorderSide(color: Colors.grey, width: 4)),
                ),
                child: RichText(
                  text: TextSpan(children: lines[i]['spans'], style: const TextStyle(color: Colors.black, fontSize: 14, fontStyle: FontStyle.italic)),
                ),
              ),
            ));
            i++;
            continue;
          }
          if (attrs != null && attrs['code-block'] == true) {
            result.add(Padding(
              padding: EdgeInsets.only(left: 24.0 * lineIndent),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(8),
                color: const Color(0xFFE0E0E0),
                width: double.infinity,
                child: RichText(
                  text: TextSpan(children: lines[i]['spans'], style: const TextStyle(fontFamily: 'monospace', color: Colors.black, fontSize: 14)),
                ),
              ),
            ));
            i++;
            continue;
          }
          // Normal paragraph
          result.add(Padding(
            padding: EdgeInsets.only(left: 24.0 * lineIndent),
            child: RichText(
              text: TextSpan(children: lines[i]['spans'], style: const TextStyle(color: Colors.black, fontSize: 14)),
            ),
          ));
          i++;
        }
        return result;
      }
      widgets.addAll(buildLines(lines, 0, 0, null, []));
      return widgets;
    } catch (e) {
      return [Text('Error parsing tasks: ${e.toString()}')];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Filter and Print
          Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: Wrap(
              spacing: 12,
              children: [
                ElevatedButton.icon(
                  onPressed: _showFilterModal,
                  icon: const Icon(Icons.filter_alt),
                  label: const Text('Filter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.infoBlue,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    if (widget.user == null) return;
                    try {
                      final pdfBytes = await generateAccomplishmentsPdf(
                        user: widget.user!,
                        records: _filteredRecords,
                        totalHours: _computeTotalHours(),
                        weekLabel: 'Week ' + (_week.isNotEmpty ? _week : '_'),
                      );
                      await Printing.sharePdf(bytes: Uint8List.fromList(pdfBytes), filename: 'accomplishments_${widget.user?.fullName}.pdf');
                      // Show success SweetAlert
                      if (context.mounted) {
                        ArtSweetAlert.show(
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.success,
                            title: "Print Successful!",
                            text: "The accomplishments PDF was generated and shared successfully.",
                          ),
                        );
                      }
                    } catch (e) {
                      // Show error SweetAlert
                      if (context.mounted) {
                        ArtSweetAlert.show(
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.danger,
                            title: "Print Failed",
                            text: "An error occurred while generating or sharing the PDF: \n"+e.toString(),
                          ),
                        );
                      }
                    }
                  },
                  icon: const Icon(Icons.print),
                  label: const Text('Print'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.successGreen,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Tabular Preview
          _buildPreview(),
        ],
      ),
    );
  }
} 