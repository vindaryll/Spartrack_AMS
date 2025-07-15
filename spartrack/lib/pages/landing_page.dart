import 'package:flutter/material.dart';
import '../common/logo_widget.dart';
import '../utils/app_colors.dart';
import 'dashboard_page.dart';
import '../models/user.dart';

class LandingPage extends StatelessWidget {
  final User user;
  const LandingPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Brand name at top left (like loading_page.dart)
          const Positioned(
            left: 26,
            top: 29,
            child: Text(
              'SparTrack',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: AppColors.primaryRed,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const LogoWidget(isWhite: false, size: 180),
                  const SizedBox(height: 40),
                  const Text(
                    'Welcome Spartans!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      height: 1.52,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Track your progress, manage your internship, and prepare for what's next — all in one place.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      height: 1.47,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: 274,
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => DashboardPage(user: user)),
                        );
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          letterSpacing: 0.07,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
