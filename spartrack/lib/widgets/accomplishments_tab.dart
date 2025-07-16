import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AccomplishmentsTab extends StatelessWidget {
  const AccomplishmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(
          'Accomplishments & RLE Records',
          style: AppColors.headingStyle.copyWith(
            fontSize: 24,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 16),
        // Info Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.infoBlue, width: 1),
          ),
          child: Row(
            children: [
              const Icon(Icons.info_outline, color: AppColors.infoBlue, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Track your daily accomplishments and RLE (Related Learning Experience) activities here. This helps monitor your progress and learning outcomes.',
                  style: AppColors.captionStyle.copyWith(
                    fontSize: 14,
                    color: AppColors.infoBlueDark,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Date Selector
        Row(
          children: [
            Text(
              'Select Date: ',
              style: AppColors.subheadingStyle.copyWith(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.fieldGray),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.calendar_today, size: 18, color: AppColors.darkGray),
                  const SizedBox(width: 8),
                  Text(
                    'Today',
                    style: AppColors.captionStyle.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_drop_down, color: AppColors.darkGray),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Accomplishments Section
        Text(
          'Daily Accomplishments',
          style: AppColors.subheadingStyle.copyWith(
            fontSize: 18,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.fieldGray),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Enter your accomplishments for the day...',
              hintStyle: AppColors.captionStyle.copyWith(
                fontSize: 14,
                color: AppColors.darkGray,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
        const SizedBox(height: 24),
        // RLE Section
        Text(
          'RLE Activities',
          style: AppColors.subheadingStyle.copyWith(
            fontSize: 18,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.fieldGray),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Describe your RLE activities and learning experiences...',
              hintStyle: AppColors.captionStyle.copyWith(
                fontSize: 14,
                color: AppColors.darkGray,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
        const SizedBox(height: 32),
        // Action Buttons
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.successGreen,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.save, color: AppColors.white),
                label: Text(
                  'Save Record',
                  style: AppColors.buttonStyle.copyWith(
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: const BorderSide(color: AppColors.successGreen),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.history, color: AppColors.successGreen),
                label: Text(
                  'View History',
                  style: AppColors.buttonStyle.copyWith(
                    fontSize: 16,
                    color: AppColors.successGreen,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
} 