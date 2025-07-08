import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/profile_card.dart';
import '../widgets/philippine_time_card.dart';
import '../widgets/dashboard_menu_buttons.dart';
import '../widgets/attendance_tab.dart';
import '../widgets/accomplishments_tab.dart';
import '../widgets/progress_dashboard_tab.dart';

class DashboardPage extends StatefulWidget {
  final User user;
  const DashboardPage({super.key, required this.user});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedTabIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  Widget _getCurrentTab() {
    switch (_selectedTabIndex) {
      case 0:
        return const AttendanceTab();
      case 1:
        return const AccomplishmentsTab();
      case 2:
        return const ProgressDashboardTab();
      default:
        return const AttendanceTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'SparTrack'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Philippine Standard Time and Date/Time
                const PhilippineTimeCard(),
                const SizedBox(height: 16),
                // Profile Card
                ProfileCard(user: widget.user),
                const SizedBox(height: 16),
                // Menu Buttons with tab switching
                DashboardMenuButtons(
                  onTabChanged: _onTabChanged,
                  selectedIndex: _selectedTabIndex,
                ),
                const SizedBox(height: 16),
                // Current Tab Content
                _getCurrentTab(),
                const SizedBox(height: 24),
                // Footer
                Container(
                  width: double.infinity,
                  height: 30,
                  color: const Color(0xFFB20000),
                  alignment: Alignment.center,
                  child: const Text(
                    '© 2025 SparTrack. All rights reserved.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 