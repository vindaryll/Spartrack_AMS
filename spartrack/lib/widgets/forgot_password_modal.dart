import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../common/custom_text_field.dart';
import '../common/custom_buttons.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import '../data_src/sample_data.dart';

class ForgotPasswordModal extends StatefulWidget {
  final void Function(String email)? onSendResetLink;
  const ForgotPasswordModal({super.key, this.onSendResetLink});

  @override
  State<ForgotPasswordModal> createState() => _ForgotPasswordModalState();
}

class _ForgotPasswordModalState extends State<ForgotPasswordModal> {
  final TextEditingController _emailController = TextEditingController();
  bool _isSending = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetLink() async {
    setState(() { _isSending = true; });
    await Future.delayed(const Duration(seconds: 1)); // Simulate sending
    if (!mounted) return;
    final email = _emailController.text.trim();
    final userExists = sampleUsers.any((user) => user.email.toLowerCase() == email.toLowerCase());
    setState(() { _isSending = false; });
    if (!mounted) return;
    if (userExists) {
      if (!mounted) return;
      await ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.success,
          title: "Password Reset Link Sent",
          text: "A password reset link has been sent to $email.",
        ),
      );
      if (widget.onSendResetLink != null) {
        widget.onSendResetLink!(email);
      }
      if (mounted) {
        Navigator.pop(context);
      }
    } else {
      if (!mounted) return;
      await ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Email Not Found",
          text: "No account found for $email.",
        ),
      );
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
                      'Forgot Password',
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
                    label: 'Email Address',
                    placeholder: 'Enter your email',
                    controller: _emailController,
                    enabled: !_isSending,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ModalButton(
                      label: _isSending ? 'Sending...' : 'Send Password Reset Link',
                      backgroundColor: AppColors.filterButtonBlue,
                      onPressed: _isSending || _emailController.text.isEmpty
                          ? () {} // Disabled state: do nothing
                          : _sendResetLink,
                      hasShadow: false,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
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