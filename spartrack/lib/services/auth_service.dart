import '../models/user.dart';

// Handles authentication logic and user credential storage.
class AuthService {
  // Used list for pre-stored credentials (for demo)
  final List<User> _users = [
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
    ),
  ];

  /// Returns the authenticated user if credentials match, else null.
  User? login(String username, String password) {
    try {
      return _users.firstWhere(
        (user) => user.username == username && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }
} 