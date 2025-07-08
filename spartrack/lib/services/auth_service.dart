import '../models/user.dart';

// Handles authentication logic and user credential storage.
class AuthService {
  // Used list for pre-stored credentials (for demo)
  final List<User> _users = [
    User(
      username: 'user',
      password: 'spartans123',
      fullName: 'ALOCILLO, MELVIN DARYLL',
      course: 'College of Informatics and Computing Sciences',
      year: 'BS Information Technology - THIRD YEAR',
      major: 'Major in Service Management',
      status: 'DEPLOYED',
      profileImage: 'assets/images/profile_1.png',
    ),
    User(
      username: 'admin',
      password: 'adminpass',
      fullName: 'ADMIN USER',
      course: 'Admin Department',
      year: 'Administrator',
      major: 'System Management',
      status: 'ACTIVE',
      profileImage: 'assets/images/profile_1.png', // Use same or different image
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