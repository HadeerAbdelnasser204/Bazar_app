import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class PasswordChangedSuccessScreen extends StatelessWidget {
  const PasswordChangedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Image.asset('assets/images/Group.png'),

              SizedBox(height: 5.h),
              Text(
                'Password changed',
                textAlign: TextAlign.center,
                style: AppTextStyles.h3,
              ),
              SizedBox(height: 2.h),
              Text(
                'Your password has been updated successfully. You can now sign in with your new password.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.grey500,
                ),
              ),
              const Spacer(flex: 3),
              CustomeButton(
                borderSide: BorderSide.none,
                text: 'Back to Sign In',
                withIcon: false,
                onPressed: () => context.go(AppRoutes.loginScreen),
                buttonColor: AppColors.primary500,
                textColor: AppColors.white,
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
