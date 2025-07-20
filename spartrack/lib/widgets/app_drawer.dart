import 'package:flutter/material.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import '../models/user.dart';
import '../pages/loading_page.dart';
import '../pages/login_page.dart';

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
    final result = await ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.warning,
        title: "Logout Confirmation",
        text: "Are you sure you want to logout?",
        showCancelBtn: true,
        confirmButtonText: "Confirm",
        cancelButtonText: "Cancel",
      ),
    );

    if (result != null && result.isTapConfirmButton) {
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
                        '${user.username}@example.com', // You can add email field to User model later
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
              // TODO: Implement change email
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change password'),
            onTap: () {
              // TODO: Implement change password
              Navigator.pop(context);
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