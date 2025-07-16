import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/app_colors.dart';

class ProfileCard extends StatelessWidget {
  final User user;
  const ProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with red background
          Container(
            height: 37,
            decoration: BoxDecoration(
              color: AppColors.accentRed,
              border: Border.all(color: AppColors.black, width: 0.5),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              'OJT Attendance Monitoring System',
              style: AppColors.subheadingStyle.copyWith(
                fontSize: 15,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Profile content
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile image
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage(user.profileImage),
                ),
                const SizedBox(width: 16),
                // User details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.fullName,
                        style: AppColors.subheadingStyle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _profileDetail(user.collegeDept),
                      _profileDetail('${user.program} - ${user.year}'),
                      _profileDetail('Major in ${user.major}'),
                      Text(
                        user.status,
                        style: AppColors.captionStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                          color: user.status == 'DEPLOYED'
                              ? AppColors.successGreen
                              : AppColors.accentRed,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileDetail(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 4,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
              color: AppColors.borderGray,
              shape: BoxShape.circle,
            ),
          ),
          Flexible(
            child: Text(
              text,
              style: AppColors.captionStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 