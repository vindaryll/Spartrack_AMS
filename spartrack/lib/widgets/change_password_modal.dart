import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../common/password_field.dart';

class ChangePasswordModal extends StatefulWidget {
  final void Function(String currentPassword, String newPassword)? onSubmit;
  const ChangePasswordModal({super.key, this.onSubmit});

  @override
  State<ChangePasswordModal> createState() => _ChangePasswordModalState();
}

class _ChangePasswordModalState extends State<ChangePasswordModal> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _reenterPasswordController = TextEditingController();

  String? _currentPasswordError;
  String? _newPasswordError;
  String? _reenterPasswordError;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _reenterPasswordController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() async {
    setState(() {
      _currentPasswordError = null;
      _newPasswordError = null;
      _reenterPasswordError = null;
    });
    final current = _currentPasswordController.text;
    final newPass = _newPasswordController.text;
    final reenter = _reenterPasswordController.text;
    bool hasError = false;
    if (current.isEmpty) {
      _currentPasswordError = 'Please enter your current password';
      hasError = true;
    }
    if (newPass.length < 8) {
      _newPasswordError = 'New password must be at least 8 characters';
      hasError = true;
    }
    if (reenter != newPass) {
      _reenterPasswordError = 'Passwords do not match';
      hasError = true;
    }
    if (reenter.isEmpty) {
      _reenterPasswordError = 'Please re-enter your new password';
      hasError = true;
    }
    setState(() {});
    if (!hasError) {
      setState(() { _isSubmitting = true; });
      await Future.delayed(const Duration(seconds: 1)); // Simulate submit
      if (!mounted) return;
      setState(() { _isSubmitting = false; });
      if (widget.onSubmit != null) {
        widget.onSubmit!(current, newPass);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(24),
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF4A4A4A), width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              height: 31,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFB20000),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                border: Border(
                  bottom: BorderSide(color: Color(0xFF4A4A4A), width: 0.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white,
                        letterSpacing: 0.07,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 20),
                    onPressed: () => Navigator.pop(context),
                    splashRadius: 18,
                    padding: const EdgeInsets.only(right: 8),
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PasswordField(
                    label: 'Current Password',
                    controller: _currentPasswordController,
                    onChanged: (_) => setState(() { _currentPasswordError = null; }),
                  ),
                  if (_currentPasswordError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 2),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _currentPasswordError!,
                          style: const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  PasswordField(
                    label: 'New Password',
                    controller: _newPasswordController,
                    onChanged: (_) => setState(() { _newPasswordError = null; }),
                  ),
                  if (_newPasswordError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 2),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _newPasswordError!,
                          style: const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  PasswordField(
                    label: 'Re-enter New Password',
                    controller: _reenterPasswordController,
                    onChanged: (_) => setState(() { _reenterPasswordError = null; }),
                  ),
                  if (_reenterPasswordError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 2),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _reenterPasswordError!,
                          style: const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _isSubmitting ? null : _validateAndSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.filterButtonBlue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _isSubmitting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text(
                              'Submit',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 