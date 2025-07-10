import 'package:flutter/material.dart';
import '../models/user.dart';

class AttendanceTab extends StatelessWidget {
  final User user;
  
  const AttendanceTab({
    super.key,
    required this.user,
  });

  String _formatTime(String? time) {
    return time ?? '--:--:-- --';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Time In/Out Buttons
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00B715),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                onPressed: () {},
                child: const Text(
                  'TIME IN',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF55B5B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                onPressed: () {},
                child: const Text(
                  'TIME OUT',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Time In/Out Labels - Left aligned with time values
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time in: ${_formatTime(user.timeIn)}',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Time out: ${_formatTime(user.timeOut)}',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Accomplishments Info Box
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF6BB),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Row(
            children: const [
              Icon(Icons.lightbulb_outline, size: 18),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Write your tasks/accomplishment below. Accomplishment/task updating is allowed anytime within the day after time-in.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Accomplishments Text Field
        const Text(
          'Accomplishments for the day',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE5E5E5),
            border: Border.all(color: Color(0xFF4A4A4A), width: 0.5),
            borderRadius: BorderRadius.circular(3),
          ),
          child: const TextField(
            maxLines: 8,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(12),
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Save Accomplishments Button
        Center(
          child: SizedBox(
            width: 322,
            height: 32,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00B715),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.save_outlined, color: Colors.white),
              label: const Text(
                'Save Accomplishments',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 0.07,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
} 