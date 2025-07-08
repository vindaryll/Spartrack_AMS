import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';
import '../common/custom_text_field.dart';
import '../widgets/logo_widget.dart';
import 'signup_page.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'dashboard_page.dart';
import '../models/user.dart';
import '../common/password_field.dart';

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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  final AuthService _authService = AuthService();

  /// Disposes controllers to free resources when the widget is removed.
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Handles the login process, including validation and feedback dialogs.
  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 1));

      final username = _usernameController.text.trim();
      final password = _passwordController.text;
      final user = _authService.login(username, password);

      setState(() {
        _isLoading = false;
      });

      if (!mounted) return;

      if (user != null) {
        ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "Login Successful!",
            text: "Welcome, ${user.fullName}!",
          ),
        ).then((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardPage(user: user),
            ),
          );
        });
      } else {
        ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "Login Failed",
            text: "Invalid username or password.",
          ),
        );
      }
    }
  }

  /// Builds the login page UI, including form and navigation.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryRed,
      appBar: AppBar(
        backgroundColor: AppColors.primaryRed,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const LogoWidget(isWhite: true, size: 100),
              const SizedBox(height: 16),
              const Text(
                'SparTrack',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        label: 'Username',
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      PasswordField(
                        label: 'Password',
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Handle forgot password
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: AppColors.darkGray,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: 'Login',
                        onPressed: _handleLogin,
                        isLoading: _isLoading,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Signup',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
