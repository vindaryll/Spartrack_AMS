import 'package:flutter/material.dart';
import 'dart:async';
import '../utils/date_time_utils.dart';

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
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Philippine Standard Time',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF4A4A4A), width: 0.5),
              borderRadius: BorderRadius.circular(3),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x26000000),
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
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  _currentTime,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black,
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