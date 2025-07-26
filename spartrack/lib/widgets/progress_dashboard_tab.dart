import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../models/user.dart';
import '../utils/time_utils.dart';

class ProgressDashboardTab extends StatelessWidget {
  final User? user;
  
  const ProgressDashboardTab({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final completedHours = TimeUtils.calculateCompletedHours(user?.attendanceRecords);
    final requiredHours = user?.requiredNoHours ?? 600;
    final remainingHours = (requiredHours - completedHours).clamp(0.0, double.infinity);
    final progressPercentage = (completedHours / requiredHours * 100).clamp(0.0, 100.0);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress Dashboard Content
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.borderGray, width: 0.5),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Column(
              children: [
                // Progress Row
                Row(
                  children: [
                    // Circular Progress Indicator
                    SizedBox(
                      width: 139,
                      height: 132,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Background circle
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightGray,
                            ),
                          ),
                          // Progress circle
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: CircularProgressIndicator(
                              value: progressPercentage / 100,
                              strokeWidth: 12,
                              backgroundColor: AppColors.lightGray,
                              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF00B715)),
                            ),
                          ),
                          // Percentage text
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${progressPercentage.toInt()}%',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: AppColors.black,
                                ),
                              ),
                              const Text(
                                'Complete',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColors.darkGray,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: 20),
                    
                    // Total Required Hours Card
                    Expanded(
                      child: _buildHourCard(
                        title: 'TOTAL REQUIRED HOURS',
                        hours: requiredHours.toInt(),
                        backgroundColor: const Color(0xFF1E88E5),
                        footerColor: const Color(0xFF145AB7),
                        icon: Icons.access_time,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Bottom Row - Completed and Remaining Hours
                Row(
                  children: [
                    // Completed Hours Card
                    Expanded(
                      child: _buildHourCard(
                        title: 'COMPLETED HOURS',
                        hours: completedHours.toInt(),
                        backgroundColor: const Color(0xFF43A047),
                        footerColor: const Color(0xFF317634),
                        icon: Icons.check_circle,
                      ),
                    ),
                    
                    const SizedBox(width: 20),
                    
                    // Remaining Hours Card
                    Expanded(
                      child: _buildHourCard(
                        title: 'REMAINING HOURS',
                        hours: remainingHours.toInt(),
                        backgroundColor: const Color(0xFFFB8C00),
                        footerColor: const Color(0xFFBB6902),
                        icon: Icons.access_time,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Recent Activities Section
          Text(
            'Recent Activities',
            style: AppColors.subheadingStyle.copyWith(
              fontSize: 18,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          
          // Recent Activities List
          _buildActivityItem(
            icon: Icons.login,
            title: 'Time In',
            subtitle: 'Today at 8:00 AM',
            color: AppColors.successGreen,
          ),
          _buildActivityItem(
            icon: Icons.logout,
            title: 'Time Out',
            subtitle: 'Today at 5:00 PM',
            color: AppColors.dangerRed,
          ),
          _buildActivityItem(
            icon: Icons.save,
            title: 'Saved Accomplishments',
            subtitle: 'Today at 4:30 PM',
            color: AppColors.infoBlue,
          ),
          _buildActivityItem(
            icon: Icons.assignment_turned_in,
            title: 'Completed RLE Task',
            subtitle: 'Yesterday at 3:15 PM',
            color: AppColors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildHourCard({
    required String title,
    required int hours,
    required Color backgroundColor,
    required Color footerColor,
    required IconData icon,
  }) {
    return Container(
      height: 172,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          // Main content area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hours.toString(),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Hours',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer
          Container(
            height: 32,
            decoration: BoxDecoration(
              color: footerColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.fieldGray),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppColors.bodyStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: AppColors.captionStyle.copyWith(
                    fontSize: 12,
                    color: AppColors.darkGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 