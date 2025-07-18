import 'attendance_record.dart';

class User {
  final String username;
  final String password;
  final String fullName;
  final String collegeDept;
  final String program;
  final String year;
  final String major;
  final String status;
  final String profileImage;
  final bool isNew;
  final String? timeIn;
  final String? timeOut;
  final List<AttendanceRecord>? attendanceRecords;
  final String? company;
  final String? collegeCoordinator;

  User({
    required this.username,
    required this.password,
    required this.fullName,
    required this.collegeDept,
    required this.program,
    required this.year,
    required this.major,
    required this.status,
    required this.profileImage,
    this.isNew = false,
    this.timeIn,
    this.timeOut,
    this.attendanceRecords,
    this.company,
    this.collegeCoordinator,
  });
} 