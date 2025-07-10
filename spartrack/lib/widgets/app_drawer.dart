import 'package:flutter/material.dart';
import '../models/user.dart';

class AppDrawer extends StatelessWidget {
  final User user;
  
  const AppDrawer({
    super.key,
    required this.user,
  });

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
            onTap: () {
              // TODO: Implement logout
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
} 