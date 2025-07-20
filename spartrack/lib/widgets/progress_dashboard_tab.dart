import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ProgressDashboardTab extends StatelessWidget {
  const ProgressDashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(
          'Progress Dashboard',
          style: AppColors.headingStyle.copyWith(
            fontSize: 24,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 16),
        // Summary Cards
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                title: 'Total Days',
                value: '45',
                icon: Icons.calendar_month,
                color: AppColors.infoBlue,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildSummaryCard(
                title: 'Attendance Rate',
                value: '98%',
                icon: Icons.check_circle,
                color: AppColors.successGreen,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildSummaryCard(
                title: 'Tasks Completed',
                value: '127',
                icon: Icons.assignment_turned_in,
                color: AppColors.orange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Progress Chart Section
        Text(
          'Weekly Progress',
          style: AppColors.subheadingStyle.copyWith(
            fontSize: 18,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.fieldGray),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowLight,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'This Week',
                    style: AppColors.subheadingStyle.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '5/7 days',
                    style: AppColors.captionStyle.copyWith(
                      fontSize: 14,
                      color: AppColors.darkGray,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Simple progress bar representation
              Row(
                children: List.generate(7, (index) {
                  bool isCompleted = index < 5;
                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      height: 60,
                      decoration: BoxDecoration(
                        color: isCompleted ? AppColors.successGreen : AppColors.fieldGray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          isCompleted ? Icons.check : Icons.close,
                          color: isCompleted ? AppColors.white : AppColors.darkGray,
                          size: 20,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mon', style: AppColors.captionStyle.copyWith(fontSize: 12, color: AppColors.darkGray)),
                  Text('Tue', style: AppColors.captionStyle.copyWith(fontSize: 12, color: AppColors.darkGray)),
                  Text('Wed', style: AppColors.captionStyle.copyWith(fontSize: 12, color: AppColors.darkGray)),
                  Text('Thu', style: AppColors.captionStyle.copyWith(fontSize: 12, color: AppColors.darkGray)),
                  Text('Fri', style: AppColors.captionStyle.copyWith(fontSize: 12, color: AppColors.darkGray)),
                  Text('Sat', style: AppColors.captionStyle.copyWith(fontSize: 12, color: AppColors.darkGray)),
                  Text('Sun', style: AppColors.captionStyle.copyWith(fontSize: 12, color: AppColors.darkGray)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Recent Activities
        Text(
          'Recent Activities',
          style: AppColors.subheadingStyle.copyWith(
            fontSize: 18,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
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
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.fieldGray),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppColors.headingStyle.copyWith(
              fontSize: 24,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppColors.captionStyle.copyWith(
              fontSize: 12,
              color: AppColors.darkGray,
            ),
            textAlign: TextAlign.center,
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