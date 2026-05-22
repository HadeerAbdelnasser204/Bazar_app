import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/verify_flow.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/otp_input_widget.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/resend_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key, this.email, this.flow = VerifyFlow.signup});

  final String? email;
  final VerifyFlow flow;

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  static const int _otpLength = 4;

  final _otpKey = GlobalKey<OtpInputWidgetState>();
  final _resendKey = GlobalKey<ResendCodeWidgetState>();

  String _otpCode = '';
  String? _errorText;

  String get _destination => widget.email?.trim().isNotEmpty == true
      ? widget.email!.trim()
      : 'your email';

  void _onVerify() {
    FocusScope.of(context).unfocus();
    if (_otpCode.length != _otpLength) {
      setState(() => _errorText = 'Please enter the $_otpLength-digit code');
      return;
    }
    // TODO: call API to verify OTP
    switch (widget.flow) {
      case VerifyFlow.forgotPassword:
        context.push(AppRoutes.newPasswordScreen);
      case VerifyFlow.signup:
        context.go(AppRoutes.homeScreen);
    }
  }

  void _onResend() {
    _otpKey.currentState?.clear();
    _resendKey.currentState?.restartTimer();
    setState(() => _errorText = null);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Code resent (demo)')));
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.fromLTRB(8.w, 2.h, 8.w, 2.h + bottomInset),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios_new, size: 20),
              ),
              SizedBox(height: 4.h),
              Center(child: Text('Verification', style: AppTextStyles.h3)),
              SizedBox(height: 2.h),
              Center(
                child: Text(
                  'Enter the $_otpLength-digit code we sent to $_destination',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey500,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              OtpInputWidget(
                key: _otpKey,
                length: _otpLength,
                onChanged: (code) {
                  setState(() {
                    _otpCode = code;
                    _errorText = null;
                  });
                },
              ),
              if (_errorText != null) ...[
                SizedBox(height: 1.h),
                Text(
                  _errorText!,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.red,
                  ),
                ),
              ],
              SizedBox(height: 8.h),
              CustomeButton(
                borderSide: BorderSide.none,
                text: 'Verify',
                withIcon: false,
                onPressed: _onVerify,
                buttonColor: AppColors.primary500,
                textColor: AppColors.white,
              ),
              SizedBox(height: 2.h),
              ResendCodeWidget(key: _resendKey, onResend: _onResend),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
