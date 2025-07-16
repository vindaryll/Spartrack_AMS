import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: const BoxDecoration(
        color: Color(0xFFB20000),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            icon: Icons.check_circle,
            label: 'Attendance',
            index: 0,
          ),
          _buildNavItem(
            icon: Icons.assignment,
            label: 'Accomplishments',
            index: 1,
          ),
          _buildNavItem(
            icon: Icons.dashboard,
            label: 'Progress Dashboard',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = selectedIndex == index;
    
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: isSelected 
                ? Border.all(color: const Color(0xFFF55B5B), width: 4)
                : null,
            ),
            child: Icon(
              icon,
              color: const Color(0xFFB20000),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
} 