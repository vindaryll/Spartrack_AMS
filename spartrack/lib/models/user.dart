import 'attendance_record.dart';
import 'college_coordinator.dart';
import 'company.dart';

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
  final String ojtDept;
  final List<AttendanceRecord>? attendanceRecords;
  final CollegeCoordinator? collegeCoordinator;
  final Company? company;

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
    required this.ojtDept,
    this.attendanceRecords,
    this.collegeCoordinator,
    this.company,
  });
} 