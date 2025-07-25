import '../models/user.dart';
import '../models/attendance_record.dart';
import '../models/college_coordinator.dart';
import '../models/company.dart';
import 'package:intl/intl.dart';

final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

final List<User> sampleUsers = [
  User(
    username: 'user',
    password: 'spartans123',
    fullName: 'ALOCILLO, MELVIN DARYLL',
    collegeDept: 'College of Informatics and Computing Sciences',
    program: 'BS Information Technology',
    year: 'THIRD YEAR',
    major: 'Service Management',
    status: 'DEPLOYED',
    profileImage: 'assets/images/profile_1.png',
    ojtDept: 'IT',
    company: Company(
      supervisorName: 'DELA CRUZ, SUSAN S.',
      role: 'Company Supervisor',
      companyAddress: '123 Mandaluyong City, Metro Manila, Philippines',
    ),
    collegeCoordinator: CollegeCoordinator(
      fullName: 'DELA CRUZ, JUAN S.',
      role: 'OJT Coordinator',
      collegeDepartment: 'CICS',
    ),
    attendanceRecords: [
      AttendanceRecord(
        date: today,
        timeIn: '07:00:00 AM',
        timeOut: null,
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Simulated today\'s attendance for user.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-07-01',
        timeIn: '09:00:34 AM',
        timeOut: '05:00:21 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Handled phone calls in a professional way.', 'list': 'bullet'},
          {'text': 'Created pubmats presentation for the event "TechX Summit 2024".', 'list': 'bullet'},
          {'text': 'Sorted files for the HR department.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-30',
        timeIn: '09:05:12 AM',
        timeOut: '05:10:45 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted in setting up the event hall.', 'list': 'bullet'},
          {'text': 'Updated the internship progress tracker.', 'list': 'bullet'},
          {'text': 'Participated in team meeting for project planning.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-29',
        timeIn: '09:02:18 AM',
        timeOut: '05:08:33 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Drafted a report on internship orientation.', 'list': 'bullet'},
          {'text': 'Researched best practices for remote work.', 'list': 'bullet'},
          {'text': 'Helped organize digital files.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-28',
        timeIn: '09:10:00 AM',
        timeOut: '05:00:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a webinar on professional development.', 'list': 'bullet'},
          {'text': 'Collaborated with team on new project.', 'list': 'bullet'},
          {'text': 'Prepared daily summary report.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-27',
        timeIn: '09:03:45 AM',
        timeOut: '05:12:10 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Learned about company policies.', 'list': 'bullet'},
          {'text': 'Shadowed a senior staff member.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-26',
        timeIn: '09:07:22 AM',
        timeOut: '05:09:55 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Helped with inventory management.', 'list': 'bullet'},
          {'text': 'Created a new spreadsheet for tracking.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-25',
        timeIn: '09:11:10 AM',
        timeOut: '05:15:20 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in brainstorming session.', 'list': 'bullet'},
          {'text': 'Wrote minutes for the weekly meeting.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-24',
        timeIn: '09:00:00 AM',
        timeOut: '05:00:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a training session on new software.', 'list': 'bullet'},
          {'text': 'Collaborated on a feature implementation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-23',
        timeIn: '09:05:00 AM',
        timeOut: '05:05:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared a presentation for the client.', 'list': 'bullet'},
          {'text': 'Assisted in troubleshooting a technical issue.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-22',
        timeIn: '09:10:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a code review meeting.', 'list': 'bullet'},
          {'text': 'Helped debug a complex bug.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-21',
        timeIn: '09:02:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the product team.', 'list': 'bullet'},
          {'text': 'Discussed project scope and deadlines.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-20',
        timeIn: '09:08:00 AM',
        timeOut: '05:08:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted with data migration tasks.', 'list': 'bullet'},
          {'text': 'Documented the migration process.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-19',
        timeIn: '09:03:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a sprint planning session.', 'list': 'bullet'},
          {'text': 'Reviewed the sprint backlog.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-18',
        timeIn: '09:07:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Helped with user testing and feedback.', 'list': 'bullet'},
          {'text': 'Documented user issues and suggestions.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-17',
        timeIn: '09:04:00 AM',
        timeOut: '05:04:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the design team.', 'list': 'bullet'},
          {'text': 'Discussed UI/UX improvements.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-16',
        timeIn: '09:09:00 AM',
        timeOut: '05:09:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a QA meeting.', 'list': 'bullet'},
          {'text': 'Reviewed test cases and test results.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-15',
        timeIn: '09:01:00 AM',
        timeOut: '05:01:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the marketing team.', 'list': 'bullet'},
          {'text': 'Discussed content strategy.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-14',
        timeIn: '09:06:00 AM',
        timeOut: '05:06:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted with social media posting.', 'list': 'bullet'},
          {'text': 'Created content for the company blog.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-13',
        timeIn: '09:02:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a team-building activity.', 'list': 'bullet'},
          {'text': 'Collaborated on a creative project.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-12',
        timeIn: '09:08:00 AM',
        timeOut: '05:08:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the HR department.', 'list': 'bullet'},
          {'text': 'Discussed employee benefits.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-11',
        timeIn: '09:03:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a training session on new software.', 'list': 'bullet'},
          {'text': 'Collaborated on a feature implementation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-10',
        timeIn: '09:07:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared a presentation for the client.', 'list': 'bullet'},
          {'text': 'Assisted in troubleshooting a technical issue.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-09',
        timeIn: '09:10:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a code review meeting.', 'list': 'bullet'},
          {'text': 'Helped debug a complex bug.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-08',
        timeIn: '09:04:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the product team.', 'list': 'bullet'},
          {'text': 'Discussed project scope and deadlines.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-07',
        timeIn: '09:09:00 AM',
        timeOut: '05:11:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a QA meeting.', 'list': 'bullet'},
          {'text': 'Reviewed test cases and test results.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-06',
        timeIn: '09:13:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the marketing team.', 'list': 'bullet'},
          {'text': 'Discussed content strategy.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-05',
        timeIn: '09:08:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted with social media posting.', 'list': 'bullet'},
          {'text': 'Created content for the company blog.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-04',
        timeIn: '09:02:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a team-building activity.', 'list': 'bullet'},
          {'text': 'Collaborated on a creative project.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-03',
        timeIn: '09:08:00 AM',
        timeOut: '05:08:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the HR department.', 'list': 'bullet'},
          {'text': 'Discussed employee benefits.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-02',
        timeIn: '09:03:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a training session on new software.', 'list': 'bullet'},
          {'text': 'Collaborated on a feature implementation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-01',
        timeIn: '09:07:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared a presentation for the client.', 'list': 'bullet'},
          {'text': 'Assisted in troubleshooting a technical issue.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-31',
        timeIn: '09:10:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a code review meeting.', 'list': 'bullet'},
          {'text': 'Helped debug a complex bug.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-30',
        timeIn: '09:04:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the product team.', 'list': 'bullet'},
          {'text': 'Discussed project scope and deadlines.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-29',
        timeIn: '09:09:00 AM',
        timeOut: '05:11:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a QA meeting.', 'list': 'bullet'},
          {'text': 'Reviewed test cases and test results.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-28',
        timeIn: '09:13:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the marketing team.', 'list': 'bullet'},
          {'text': 'Discussed content strategy.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-27',
        timeIn: '09:08:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted with social media posting.', 'list': 'bullet'},
          {'text': 'Created content for the company blog.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-26',
        timeIn: '09:02:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a team-building activity.', 'list': 'bullet'},
          {'text': 'Collaborated on a creative project.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-25',
        timeIn: '09:08:00 AM',
        timeOut: '05:08:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the HR department.', 'list': 'bullet'},
          {'text': 'Discussed employee benefits.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-24',
        timeIn: '09:03:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a training session on new software.', 'list': 'bullet'},
          {'text': 'Collaborated on a feature implementation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-23',
        timeIn: '09:07:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared a presentation for the client.', 'list': 'bullet'},
          {'text': 'Assisted in troubleshooting a technical issue.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-22',
        timeIn: '09:10:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a code review meeting.', 'list': 'bullet'},
          {'text': 'Helped debug a complex bug.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-21',
        timeIn: '09:04:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the product team.', 'list': 'bullet'},
          {'text': 'Discussed project scope and deadlines.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-20',
        timeIn: '09:09:00 AM',
        timeOut: '05:11:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a QA meeting.', 'list': 'bullet'},
          {'text': 'Reviewed test cases and test results.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-19',
        timeIn: '09:13:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the marketing team.', 'list': 'bullet'},
          {'text': 'Discussed content strategy.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-18',
        timeIn: '09:08:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted with social media posting.', 'list': 'bullet'},
          {'text': 'Created content for the company blog.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-17',
        timeIn: '09:02:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a team-building activity.', 'list': 'bullet'},
          {'text': 'Collaborated on a creative project.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-16',
        timeIn: '09:08:00 AM',
        timeOut: '05:08:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the HR department.', 'list': 'bullet'},
          {'text': 'Discussed employee benefits.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-15',
        timeIn: '09:03:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a training session on new software.', 'list': 'bullet'},
          {'text': 'Collaborated on a feature implementation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-14',
        timeIn: '09:07:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared a presentation for the client.', 'list': 'bullet'},
          {'text': 'Assisted in troubleshooting a technical issue.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-13',
        timeIn: '09:10:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a code review meeting.', 'list': 'bullet'},
          {'text': 'Helped debug a complex bug.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-12',
        timeIn: '09:04:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the product team.', 'list': 'bullet'},
          {'text': 'Discussed project scope and deadlines.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-11',
        timeIn: '09:09:00 AM',
        timeOut: '05:11:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a QA meeting.', 'list': 'bullet'},
          {'text': 'Reviewed test cases and test results.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-10',
        timeIn: '09:13:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the marketing team.', 'list': 'bullet'},
          {'text': 'Discussed content strategy.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-09',
        timeIn: '09:08:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted with social media posting.', 'list': 'bullet'},
          {'text': 'Created content for the company blog.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-08',
        timeIn: '09:02:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a team-building activity.', 'list': 'bullet'},
          {'text': 'Collaborated on a creative project.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-07',
        timeIn: '09:08:00 AM',
        timeOut: '05:08:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the HR department.', 'list': 'bullet'},
          {'text': 'Discussed employee benefits.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-06',
        timeIn: '09:03:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a training session on new software.', 'list': 'bullet'},
          {'text': 'Collaborated on a feature implementation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-05',
        timeIn: '09:07:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared a presentation for the client.', 'list': 'bullet'},
          {'text': 'Assisted in troubleshooting a technical issue.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-04',
        timeIn: '09:10:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a code review meeting.', 'list': 'bullet'},
          {'text': 'Helped debug a complex bug.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-03',
        timeIn: '09:04:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the product team.', 'list': 'bullet'},
          {'text': 'Discussed project scope and deadlines.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-02',
        timeIn: '09:09:00 AM',
        timeOut: '05:11:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a QA meeting.', 'list': 'bullet'},
          {'text': 'Reviewed test cases and test results.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-01',
        timeIn: '09:13:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the marketing team.', 'list': 'bullet'},
          {'text': 'Discussed content strategy.', 'list': 'bullet'},
        ]),
      ),
    ],
  ),
  User(
    username: 'user2',
    password: 'password123',
    fullName: 'JOSE, PRINCESS MIKHAELA',
    collegeDept: 'College of Informatics and Computing Sciences',
    program: 'BS Information Technology',
    year: 'THIRD YEAR',
    major: 'Service Management',
    status: 'DEPLOYED',
    profileImage: 'assets/images/profile_2.png',
    isNew: true,
    ojtDept: 'IT',
    company: Company(
      supervisorName: 'DELA CRUZ, SUSAN S.',
      role: 'Company Supervisor',
      companyAddress: '123 Mandaluyong City, Metro Manila, Philippines',
    ),
    collegeCoordinator: CollegeCoordinator(
      fullName: 'DELA CRUZ, JUAN S.',
      role: 'OJT Coordinator',
      collegeDepartment: 'CICS',
    ),
    attendanceRecords: [
      AttendanceRecord(
        date: today,
        timeIn: null,
        timeOut: null,
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Simulated today\'s attendance for user2.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-07-01',
        timeIn: '08:55:14 AM',
        timeOut: '04:50:49 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Drafted a report on internship orientation.', 'list': 'bullet'},
          {'text': 'Researched best practices for remote work.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-30',
        timeIn: '09:01:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Helped organize digital files.', 'list': 'bullet'},
          {'text': 'Assisted in data entry tasks.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-29',
        timeIn: '09:03:00 AM',
        timeOut: '05:05:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a webinar on professional development.', 'list': 'bullet'},
          {'text': 'Collaborated with team on new project.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-28',
        timeIn: '09:10:00 AM',
        timeOut: '05:00:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared daily summary report.', 'list': 'bullet'},
          {'text': 'Assisted supervisor with documentation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-27',
        timeIn: '09:03:45 AM',
        timeOut: '05:12:10 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Learned about company policies.', 'list': 'bullet'},
          {'text': 'Shadowed a senior staff member.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-26',
        timeIn: '09:07:22 AM',
        timeOut: '05:09:55 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Helped with inventory management.', 'list': 'bullet'},
          {'text': 'Created a new spreadsheet for tracking.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-25',
        timeIn: '09:11:10 AM',
        timeOut: '05:15:20 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in brainstorming session.', 'list': 'bullet'},
          {'text': 'Wrote minutes for the weekly meeting.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-24',
        timeIn: '09:00:00 AM',
        timeOut: '05:00:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a training session on new software.', 'list': 'bullet'},
          {'text': 'Collaborated on a feature implementation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-23',
        timeIn: '09:05:00 AM',
        timeOut: '05:05:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared a presentation for the client.', 'list': 'bullet'},
          {'text': 'Assisted in troubleshooting a technical issue.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-22',
        timeIn: '09:10:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a code review meeting.', 'list': 'bullet'},
          {'text': 'Helped debug a complex bug.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-21',
        timeIn: '09:02:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the product team.', 'list': 'bullet'},
          {'text': 'Discussed project scope and deadlines.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-20',
        timeIn: '09:08:00 AM',
        timeOut: '05:08:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted with data migration tasks.', 'list': 'bullet'},
          {'text': 'Documented the migration process.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-19',
        timeIn: '09:03:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a sprint planning session.', 'list': 'bullet'},
          {'text': 'Reviewed the sprint backlog.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-18',
        timeIn: '09:07:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Helped with user testing and feedback.', 'list': 'bullet'},
          {'text': 'Documented user issues and suggestions.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-17',
        timeIn: '09:04:00 AM',
        timeOut: '05:04:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the design team.', 'list': 'bullet'},
          {'text': 'Discussed UI/UX improvements.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-16',
        timeIn: '09:09:00 AM',
        timeOut: '05:09:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a QA meeting.', 'list': 'bullet'},
          {'text': 'Reviewed test cases and test results.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-15',
        timeIn: '09:01:00 AM',
        timeOut: '05:01:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the marketing team.', 'list': 'bullet'},
          {'text': 'Discussed content strategy.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-14',
        timeIn: '09:06:00 AM',
        timeOut: '05:06:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted with social media posting.', 'list': 'bullet'},
          {'text': 'Created content for the company blog.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-13',
        timeIn: '09:02:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a team-building activity.', 'list': 'bullet'},
          {'text': 'Collaborated on a creative project.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-12',
        timeIn: '09:08:00 AM',
        timeOut: '05:08:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the HR department.', 'list': 'bullet'},
          {'text': 'Discussed employee benefits.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-11',
        timeIn: '09:03:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a training session on new software.', 'list': 'bullet'},
          {'text': 'Collaborated on a feature implementation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-10',
        timeIn: '09:07:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared a presentation for the client.', 'list': 'bullet'},
          {'text': 'Assisted in troubleshooting a technical issue.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-09',
        timeIn: '09:10:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a code review meeting.', 'list': 'bullet'},
          {'text': 'Helped debug a complex bug.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-08',
        timeIn: '09:04:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the product team.', 'list': 'bullet'},
          {'text': 'Discussed project scope and deadlines.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-07',
        timeIn: '09:09:00 AM',
        timeOut: '05:11:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a QA meeting.', 'list': 'bullet'},
          {'text': 'Reviewed test cases and test results.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-06',
        timeIn: '09:13:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the marketing team.', 'list': 'bullet'},
          {'text': 'Discussed content strategy.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-05',
        timeIn: '09:08:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted with social media posting.', 'list': 'bullet'},
          {'text': 'Created content for the company blog.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-04',
        timeIn: '09:02:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a team-building activity.', 'list': 'bullet'},
          {'text': 'Collaborated on a creative project.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-03',
        timeIn: '09:08:00 AM',
        timeOut: '05:08:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the HR department.', 'list': 'bullet'},
          {'text': 'Discussed employee benefits.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-02',
        timeIn: '09:03:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a training session on new software.', 'list': 'bullet'},
          {'text': 'Collaborated on a feature implementation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-06-01',
        timeIn: '09:07:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared a presentation for the client.', 'list': 'bullet'},
          {'text': 'Assisted in troubleshooting a technical issue.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-31',
        timeIn: '09:10:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a code review meeting.', 'list': 'bullet'},
          {'text': 'Helped debug a complex bug.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-30',
        timeIn: '09:04:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the product team.', 'list': 'bullet'},
          {'text': 'Discussed project scope and deadlines.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-29',
        timeIn: '09:09:00 AM',
        timeOut: '05:11:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a QA meeting.', 'list': 'bullet'},
          {'text': 'Reviewed test cases and test results.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-28',
        timeIn: '09:13:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the marketing team.', 'list': 'bullet'},
          {'text': 'Discussed content strategy.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-27',
        timeIn: '09:08:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted with social media posting.', 'list': 'bullet'},
          {'text': 'Created content for the company blog.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-26',
        timeIn: '09:02:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a team-building activity.', 'list': 'bullet'},
          {'text': 'Collaborated on a creative project.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-25',
        timeIn: '09:08:00 AM',
        timeOut: '05:08:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the HR department.', 'list': 'bullet'},
          {'text': 'Discussed employee benefits.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-24',
        timeIn: '09:03:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a training session on new software.', 'list': 'bullet'},
          {'text': 'Collaborated on a feature implementation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-23',
        timeIn: '09:07:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared a presentation for the client.', 'list': 'bullet'},
          {'text': 'Assisted in troubleshooting a technical issue.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-22',
        timeIn: '09:10:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a code review meeting.', 'list': 'bullet'},
          {'text': 'Helped debug a complex bug.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-21',
        timeIn: '09:04:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the product team.', 'list': 'bullet'},
          {'text': 'Discussed project scope and deadlines.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-20',
        timeIn: '09:09:00 AM',
        timeOut: '05:11:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a QA meeting.', 'list': 'bullet'},
          {'text': 'Reviewed test cases and test results.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-19',
        timeIn: '09:13:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the marketing team.', 'list': 'bullet'},
          {'text': 'Discussed content strategy.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-18',
        timeIn: '09:08:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted with social media posting.', 'list': 'bullet'},
          {'text': 'Created content for the company blog.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-17',
        timeIn: '09:02:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a team-building activity.', 'list': 'bullet'},
          {'text': 'Collaborated on a creative project.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-16',
        timeIn: '09:08:00 AM',
        timeOut: '05:08:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the HR department.', 'list': 'bullet'},
          {'text': 'Discussed employee benefits.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-15',
        timeIn: '09:03:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a training session on new software.', 'list': 'bullet'},
          {'text': 'Collaborated on a feature implementation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-14',
        timeIn: '09:07:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared a presentation for the client.', 'list': 'bullet'},
          {'text': 'Assisted in troubleshooting a technical issue.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-13',
        timeIn: '09:10:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a code review meeting.', 'list': 'bullet'},
          {'text': 'Helped debug a complex bug.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-12',
        timeIn: '09:04:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the product team.', 'list': 'bullet'},
          {'text': 'Discussed project scope and deadlines.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-11',
        timeIn: '09:09:00 AM',
        timeOut: '05:11:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a QA meeting.', 'list': 'bullet'},
          {'text': 'Reviewed test cases and test results.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-10',
        timeIn: '09:13:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the marketing team.', 'list': 'bullet'},
          {'text': 'Discussed content strategy.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-09',
        timeIn: '09:08:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Assisted with social media posting.', 'list': 'bullet'},
          {'text': 'Created content for the company blog.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-08',
        timeIn: '09:02:00 AM',
        timeOut: '05:02:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a team-building activity.', 'list': 'bullet'},
          {'text': 'Collaborated on a creative project.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-07',
        timeIn: '09:08:00 AM',
        timeOut: '05:08:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the HR department.', 'list': 'bullet'},
          {'text': 'Discussed employee benefits.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-06',
        timeIn: '09:03:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a training session on new software.', 'list': 'bullet'},
          {'text': 'Collaborated on a feature implementation.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-05',
        timeIn: '09:07:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Prepared a presentation for the client.', 'list': 'bullet'},
          {'text': 'Assisted in troubleshooting a technical issue.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-04',
        timeIn: '09:10:00 AM',
        timeOut: '05:10:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a code review meeting.', 'list': 'bullet'},
          {'text': 'Helped debug a complex bug.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-03',
        timeIn: '09:04:00 AM',
        timeOut: '05:03:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the product team.', 'list': 'bullet'},
          {'text': 'Discussed project scope and deadlines.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-02',
        timeIn: '09:09:00 AM',
        timeOut: '05:11:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Participated in a QA meeting.', 'list': 'bullet'},
          {'text': 'Reviewed test cases and test results.', 'list': 'bullet'},
        ]),
      ),
      AttendanceRecord(
        date: '2024-05-01',
        timeIn: '09:13:00 AM',
        timeOut: '05:07:00 PM',
        accomplishmentsDelta: AttendanceRecord.richDelta([
          {'text': 'Attended a meeting with the marketing team.', 'list': 'bullet'},
          {'text': 'Discussed content strategy.', 'list': 'bullet'},
        ]),
      ),
    ],
  ),
]; 