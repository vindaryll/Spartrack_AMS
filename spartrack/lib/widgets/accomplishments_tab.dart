import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import '../utils/app_colors.dart';
import '../models/user.dart';
import '../models/attendance_record.dart';

class AccomplishmentsTab extends StatefulWidget {
  final User? user;
  const AccomplishmentsTab({super.key, this.user});

  @override
  State<AccomplishmentsTab> createState() => _AccomplishmentsTabState();
}

class _AccomplishmentsTabState extends State<AccomplishmentsTab> {
  DateTime? _fromDate;
  DateTime? _toDate;
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
        if (_fromDate != null && recDate.isBefore(_fromDate!)) return false;
        if (_toDate != null && recDate.isAfter(_toDate!)) return false;
        return true;
      }).toList();
      _filteredRecords.sort((a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));
    });
  }

  Future<void> _showFilterModal() async {
    DateTime? tempFrom = _fromDate;
    DateTime? tempTo = _toDate;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter Records'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text('From: '),
                  TextButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: tempFrom ?? DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) setState(() => tempFrom = picked);
                    },
                    child: Text(tempFrom != null ? DateFormat('yyyy-MM-dd').format(tempFrom!) : 'Select'),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('To: '),
                  TextButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: tempTo ?? DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) setState(() => tempTo = picked);
                    },
                    child: Text(tempTo != null ? DateFormat('yyyy-MM-dd').format(tempTo!) : 'Select'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        tempFrom = null;
                        tempTo = null;
                        _fromDate = null;
                        _toDate = null;
                      });
                      Navigator.pop(context);
                      _applyFilter();
                    },
                    child: const Text('Clear Filter'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _fromDate = tempFrom;
                        _toDate = tempTo;
                      });
                      Navigator.pop(context);
                      _applyFilter();
                    },
                    child: const Text('Filter'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDateDay(String date) {
    final dt = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dt);
    final dateStr = DateFormat('MMMM d, yyyy').format(dt);
    return '$dateStr\n$dayName';
  }

  int _computeTotalHours() {
    return _filteredRecords.length * 8;
  }

  Widget _buildPreview() {
    final user = widget.user;
    if (user == null) return const SizedBox.shrink();
    final company = user.company;
    final coordinator = user.collegeCoordinator;
    final records = _filteredRecords;
    final totalHours = _computeTotalHours();
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
                const Center(
                  child: Text('Week 4', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
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
                              const Padding(
                                padding: EdgeInsets.all(8),
                                child: Text('8'),
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
                              child: Text('$totalHours hours', style: const TextStyle(fontWeight: FontWeight.bold)),
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
      int i = 0;
      int orderedIndex = 1;
      while (i < delta.length) {
        final op = delta[i];
        if (op is! Map || op['insert'] == null) {
          i++;
          continue;
        }
        final text = op['insert'].toString().replaceAll('\n', '');
        Map<String, dynamic>? attrs;
        if (i + 1 < delta.length && delta[i + 1] is Map && delta[i + 1]['attributes'] != null) {
          attrs = Map<String, dynamic>.from(delta[i + 1]['attributes']);
        }
        TextStyle style = const TextStyle();
        if (attrs != null) {
          if (attrs['bold'] == true) style = style.merge(const TextStyle(fontWeight: FontWeight.bold));
          if (attrs['italic'] == true) style = style.merge(const TextStyle(fontStyle: FontStyle.italic));
          if (attrs['underline'] == true) style = style.merge(const TextStyle(decoration: TextDecoration.underline));
          if (attrs['strike'] == true) style = style.merge(const TextStyle(decoration: TextDecoration.lineThrough));
          if (attrs['code'] == true) style = style.merge(const TextStyle(fontFamily: 'monospace', backgroundColor: Color(0xFFE0E0E0)));
        }
        if (attrs != null && attrs['list'] == 'bullet') {
          if (text.isNotEmpty) {
            widgets.add(Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(child: Text(text, style: style)),
              ],
            ));
          }
          i += 2;
        } else if (attrs != null && attrs['list'] == 'ordered') {
          if (text.isNotEmpty) {
            widgets.add(Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${orderedIndex++}. ', style: const TextStyle(fontWeight: FontWeight.bold)),
                Expanded(child: Text(text, style: style)),
              ],
            ));
          }
          i += 2;
        } else if (attrs != null && attrs['list'] == 'checked') {
          widgets.add(Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(attrs['checked'] == true ? '✓ ' : '☐ ', style: const TextStyle(fontWeight: FontWeight.bold)),
              Expanded(child: Text(text, style: style)),
            ],
          ));
          i += 2;
        } else if (attrs != null && attrs['header'] != null) {
          widgets.add(Text(
            text,
            style: style.merge(TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: (14 + 2 * (3 - (attrs['header'] is int ? attrs['header'] as int : 3))).toDouble(),
            )),
          ));
          i += 2;
        } else {
          if (text.isNotEmpty) {
            widgets.add(Text(text, style: style));
          }
          i++;
        }
      }
      return widgets;
    } catch (_) {
      return [const Text('Error parsing tasks')];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Accomplishments & RLE Records',
            style: AppColors.headingStyle.copyWith(
              fontSize: 24,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
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
                  onPressed: () {
                    // TODO: Implement print logic
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