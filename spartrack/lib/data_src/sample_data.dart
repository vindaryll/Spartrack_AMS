import '../models/user.dart';

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
    timeIn: '09:30:00 AM',
    timeOut: null,
  ),
  User(
    username: 'user2',
    password: 'password123',
    fullName: 'JOSE, PRINCESS MIKHAELA',
    collegeDept: 'College of Informatics and Computing Sciences',
    program: 'BS Information Technology',
    year: 'THIRD YEAR',
    major: 'Service Management',
    status: 'NOT DEPLOYED',
    profileImage: 'assets/images/profile_2.png',
    isNew: true,
    timeIn: null,
    timeOut: null,
  ),
]; 