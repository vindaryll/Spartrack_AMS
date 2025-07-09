import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../utils/app_colors.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // App name at top left
          Positioned(
            left: 26,
            top: 29,
            child: Text(
              'SparTrack',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: AppColors.primaryRed,
              ),
            ),
          ),
          // Centered logo
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LogoWidget(isWhite: false, size: 174),
                const SizedBox(height: 60),
                // Animated progress bar
                const AnimatedLoadingProgressBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedLoadingProgressBar extends StatefulWidget {
  const AnimatedLoadingProgressBar({super.key});

  @override
  State<AnimatedLoadingProgressBar> createState() => _AnimatedLoadingProgressBarState();
}

class _AnimatedLoadingProgressBarState extends State<AnimatedLoadingProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double barWidth = 307;
    const double barHeight = 23;
    return SizedBox(
      width: barWidth,
      height: barHeight,
      child: Stack(
        children: [
          // Red background
          Container(
            width: barWidth,
            height: barHeight,
            decoration: BoxDecoration(
              color: AppColors.primaryRed,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          // Animated white overlay
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double whiteWidth = barWidth * (1 - _controller.value);
              return Positioned(
                left: barWidth - whiteWidth,
                child: Container(
                  width: whiteWidth,
                  height: barHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.primaryRed, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
} 