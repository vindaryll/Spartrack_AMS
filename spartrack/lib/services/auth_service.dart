import '../models/user.dart';
import '../data_src/sample_data.dart';

// Handles authentication logic and user credential storage.
class AuthService {
  // Use imported sample data
  final List<User> _users = sampleUsers;

  List<User> get users => _users;

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