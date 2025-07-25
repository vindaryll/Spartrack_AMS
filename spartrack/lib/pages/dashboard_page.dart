import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/profile_card.dart';
import '../widgets/philippine_time_card.dart';
import '../widgets/attendance_tab.dart';
import '../widgets/accomplishments_tab.dart';
import '../widgets/progress_dashboard_tab.dart';
import '../widgets/app_drawer.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../common/brand_app_bar.dart';
import '../utils/app_colors.dart';

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
        return AttendanceTab(user: widget.user);
      case 1:
        return AccomplishmentsTab(user: widget.user);
      case 2:
        return const ProgressDashboardTab();
      default:
        return AttendanceTab(user: widget.user);
    }
  }

  String _getTabHeader() {
    switch (_selectedTabIndex) {
      case 0:
        return 'ATTENDANCE';
      case 1:
        return 'ACCOMPLISHMENT RECORDS';
      case 2:
        return 'PROGRESS DASHBOARD';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BrandAppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF4A4A4A)),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: AppDrawer(user: widget.user),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                      // Main Tab Container with dynamic header
                      Container(
                        width: 394,
                        margin: const EdgeInsets.only(left: 9, top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.borderGray, width: 0.5),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadowDark.withOpacity(0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 41.65,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.accentRed,
                                border: Border.all(color: AppColors.borderGray, width: 0.5),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  topRight: Radius.circular(3),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                _getTabHeader(),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  height: 1.1,
                                  color: Colors.white,
                                  letterSpacing: 0.07,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                              child: _getCurrentTab(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom Navigation Bar
            CustomBottomNavigationBar(
              selectedIndex: _selectedTabIndex,
              onTap: _onTabChanged,
            ),
          ],
        ),
      ),
    );
  }
} 