import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../common/custom_text_field.dart';

class ChangeEmailModal extends StatefulWidget {
  final void Function(String newEmail)? onSubmit;
  const ChangeEmailModal({super.key, this.onSubmit});

  @override
  State<ChangeEmailModal> createState() => _ChangeEmailModalState();
}

class _ChangeEmailModalState extends State<ChangeEmailModal> {
  final TextEditingController _newEmailController = TextEditingController();
  String? _newEmailError;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _newEmailController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    return email.endsWith('@g.batstate-u.edu.ph') && email.contains('@');
  }

  void _validateAndSubmit() async {
    setState(() {
      _newEmailError = null;
    });
    final newEmail = _newEmailController.text.trim();
    bool hasError = false;
    
    if (newEmail.isEmpty) {
      _newEmailError = 'Please enter your new email address';
      hasError = true;
    } else if (!_isValidEmail(newEmail)) {
      _newEmailError = 'Only @g.batstate-u.edu.ph emails are allowed';
      hasError = true;
    }
    
    setState(() {});
    if (!hasError) {
      setState(() { _isSubmitting = true; });
      await Future.delayed(const Duration(seconds: 1)); // Simulate submit
      if (!mounted) return;
      setState(() { _isSubmitting = false; });
      if (widget.onSubmit != null) {
        widget.onSubmit!(newEmail);
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
                      'Change Email',
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
                  CustomTextField(
                    label: 'New Email',
                    placeholder: 'Enter your new email',
                    controller: _newEmailController,
                    enabled: !_isSubmitting,
                    onChanged: (_) => setState(() { _newEmailError = null; }),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  if (_newEmailError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 2),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _newEmailError!,
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
                              'Send Verification Link',
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