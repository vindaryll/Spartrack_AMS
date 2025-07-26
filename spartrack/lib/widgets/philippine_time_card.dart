import 'package:flutter/material.dart';
import 'dart:async';
import '../utils/date_time_utils.dart';
import '../utils/app_colors.dart';

class PhilippineTimeCard extends StatefulWidget {
  const PhilippineTimeCard({super.key});

  @override
  State<PhilippineTimeCard> createState() => _PhilippineTimeCardState();
}

class _PhilippineTimeCardState extends State<PhilippineTimeCard> {
  Timer? _timer;
  String _currentDate = '';
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateDateTime();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateDateTime() {
    setState(() {
      _currentDate = DateTimeUtils.getFormattedDate();
      _currentTime = DateTimeUtils.getFormattedTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Philippine Standard Time',
            style: AppColors.captionStyle.copyWith(
              fontSize: 12,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.borderGray, width: 0.5),
              borderRadius: BorderRadius.circular(3),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _currentDate,
                  style: AppColors.bodyStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  _currentTime,
                  style: AppColors.bodyStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.black,
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