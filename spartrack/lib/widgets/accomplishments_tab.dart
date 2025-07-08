import 'package:flutter/material.dart';

class AccomplishmentsTab extends StatelessWidget {
  const AccomplishmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        const Text(
          'Accomplishments & RLE Records',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        
        // Info Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF2196F3), width: 1),
          ),
          child: Row(
            children: const [
              Icon(Icons.info_outline, color: Color(0xFF2196F3), size: 24),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Track your daily accomplishments and RLE (Related Learning Experience) activities here. This helps monitor your progress and learning outcomes.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xFF1976D2),
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
            const Text(
              'Select Date: ',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Today',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        
        // Accomplishments Section
        const Text(
          'Daily Accomplishments',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TextField(
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Enter your accomplishments for the day...',
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.grey,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        ),
        const SizedBox(height: 24),
        
        // RLE Section
        const Text(
          'RLE Activities',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TextField(
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Describe your RLE activities and learning experiences...',
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.grey,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
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
                  backgroundColor: const Color(0xFF00B715),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  'Save Record',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: const BorderSide(color: Color(0xFF00B715)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.history, color: Color(0xFF00B715)),
                label: const Text(
                  'View History',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF00B715),
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