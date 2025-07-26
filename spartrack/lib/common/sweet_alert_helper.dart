import 'package:flutter/material.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import '../utils/app_colors.dart';

class SweetAlertHelper {
  // Success Alert
  static Future<void> showSuccess({
    required BuildContext context,
    required String title,
    required String text,
  }) async {
    await ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.success,
        title: title,
        text: text,
      ),
    );
  }

  // Error Alert
  static Future<void> showError({
    required BuildContext context,
    required String title,
    required String text,
  }) async {
    await ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.danger,
        title: title,
        text: text,
      ),
    );
  }

  // Question/Confirmation Alert
  static Future<bool> showQuestion({
    required BuildContext context,
    required String title,
    required String text,
    bool showCancelBtn = true,
    String confirmButtonText = "Confirm",
    String cancelButtonText = "Cancel",
  }) async {
    final result = await ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.question,
        title: title,
        text: text,
        showCancelBtn: showCancelBtn,
        confirmButtonText: confirmButtonText,
        cancelButtonText: cancelButtonText,
      ),
    );
    return result?.isTapConfirmButton ?? false;
  }

  // Custom Question/Confirmation Alert with reversed buttons and colors
  static Future<bool> showCustomQuestion({
    required BuildContext context,
    required String title,
    required String text,
    String confirmButtonText = "Confirm",
    String cancelButtonText = "Cancel",
  }) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(24),
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 500),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: Opacity(
                  opacity: value,
                  child: Container(
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowDark.withValues(alpha: (value * 0.4 * 255).round().toDouble()),
                          blurRadius: 10 * value,
                          offset: Offset(0, 4 * value),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header with question icon
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppColors.accentRed,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.help_outline,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        // Content
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              Text(
                                title,
                                style: AppColors.subheadingStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                text,
                                style: AppColors.bodyStyle.copyWith(
                                  fontSize: 14,
                                  color: AppColors.darkGray,
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                              // Buttons - Reversed order
                              Row(
                                children: [
                                  // Cancel button (left) - Gray
                                  Expanded(
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () => Navigator.of(context).pop(false),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.fieldGray,
                                          foregroundColor: AppColors.darkGray,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          elevation: 0,
                                          shadowColor: Colors.transparent,
                                        ),
                                        child: Text(
                                          cancelButtonText,
                                          style: AppColors.buttonStyle.copyWith(
                                            color: AppColors.darkGray,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Confirm button (right) - Green
                                  Expanded(
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () => Navigator.of(context).pop(true),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.successGreen,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          elevation: 0,
                                          shadowColor: Colors.transparent,
                                        ),
                                        child: Text(
                                          confirmButtonText,
                                          style: AppColors.buttonStyle.copyWith(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    ) ?? false;
  }
} 