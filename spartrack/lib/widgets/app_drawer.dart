import 'package:flutter/material.dart';
import '../common/sweet_alert_helper.dart';
import '../models/user.dart';
import '../pages/loading_page.dart';
import '../pages/login_page.dart';
import 'change_password_modal.dart';
import 'change_email_modal.dart';

class AppDrawer extends StatelessWidget {
  final User user;
  
  const AppDrawer({
    super.key,
    required this.user,
  });

  void _handleLogout(BuildContext context) async {

    // Capture a valid NavigatorState before popping the drawer
    final navigator = Navigator.of(context, rootNavigator: true);
    Navigator.pop(context); // Close the drawer first
    final result = await SweetAlertHelper.showQuestion(
      context: context,
      title: "Logout Confirmation",
      text: "Are you sure you want to logout?",
    );

    if (result) {
      navigator.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoadingPage()),
        (route) => false,
      );
      await Future.delayed(const Duration(seconds: 2));
      navigator.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFB20000),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(user.profileImage),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        user.fullName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user.username,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        user.email,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Change email'),
            onTap: () {
              Navigator.pop(context); // Close the drawer first
              showDialog(
                context: context,
                builder: (context) => ChangeEmailModal(
                  onSubmit: (newEmail) async {
                    // TODO: Implement email change logic
                    if (context.mounted) {
                      await SweetAlertHelper.showSuccess(
                        context: context,
                        title: "Verification Link Sent",
                        text: "A verification link has been sent to $newEmail.",
                      );
                    }
                    if (context.mounted) {
                      Navigator.pop(context); // Close the modal after success
                    }
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change password'),
            onTap: () {
              Navigator.pop(context); // Close the drawer first
              showDialog(
                context: context,
                builder: (context) => ChangePasswordModal(
                  onSubmit: (currentPassword, newPassword) async {
                    if (currentPassword == user.password) {
                      if (context.mounted) {
                        await SweetAlertHelper.showSuccess(
                          context: context,
                          title: "Password Changed",
                          text: "Your password has been updated successfully.",
                        );
                      }
                      if (context.mounted) {
                        Navigator.pop(context); // Close the modal after success
                      }
                    } else {
                      if (context.mounted) {
                        await SweetAlertHelper.showError(
                          context: context,
                          title: "Change Failed",
                          text: "Current password is incorrect.",
                        );
                      }
                    }
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => _handleLogout(context),
          ),
        ],
      ),
    );
  }
} 