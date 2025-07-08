import 'package:flutter/material.dart';

class DashboardMenuButtons extends StatefulWidget {
  final Function(int)? onTabChanged;
  final int selectedIndex;
  
  const DashboardMenuButtons({
    super.key,
    this.onTabChanged,
    this.selectedIndex = 0,
  });

  @override
  State<DashboardMenuButtons> createState() => _DashboardMenuButtonsState();
}

class _DashboardMenuButtonsState extends State<DashboardMenuButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _DashboardMenuButton(
              label: 'Attendance',
              icon: Icons.check_circle,
              isSelected: widget.selectedIndex == 0,
              onTap: () => widget.onTabChanged?.call(0),
            ),
            const SizedBox(width: 8),
            _DashboardMenuButton(
              label: 'Accomplishments/RLE',
              icon: Icons.assignment,
              isSelected: widget.selectedIndex == 1,
              onTap: () => widget.onTabChanged?.call(1),
            ),
            const SizedBox(width: 8),
            _DashboardMenuButton(
              label: 'Progress Dashboard',
              icon: Icons.dashboard,
              isSelected: widget.selectedIndex == 2,
              onTap: () => widget.onTabChanged?.call(2),
            ),
          ],
        ),
      ],
    );
  }
}

class _DashboardMenuButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _DashboardMenuButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_DashboardMenuButton> createState() => _DashboardMenuButtonState();
}

class _DashboardMenuButtonState extends State<_DashboardMenuButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 36,
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white,
                width: _isHovered ? 1.5 : 1.0,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 13,
                  backgroundColor: const Color(0xFFB20000),
                  child: Icon(widget.icon, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: widget.label.length > 12 ? 10 : 12,
                    color: _getTextColor(),
                    letterSpacing: 0.07,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (widget.isSelected) {
      return const Color(0xFFE57373); // Lighter red for better contrast
    }
    if (_isHovered) {
      return Colors.grey.shade100;
    }
    return Colors.white;
  }

  Color _getTextColor() {
    if (widget.isSelected) {
      return Colors.white;
    }
    if (_isHovered) {
      return const Color(0xFFB20000);
    }
    return Colors.black;
  }
} 