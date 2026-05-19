import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                "Welcome back, you've been missed!",
                style: AppTextStyles.h3,
              ),
              SizedBox(height: 1.h),
              Text(
                "Sign in to your account",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.grey500,
                ),
              ),
              SizedBox(height: 6.h),

              Custom_text_field(label: "Email", hintText: "Enter your email"),
              SizedBox(height: 1.h),

              Custom_text_field(
                label: "Password",
                hintText: "Enter your password",
              ),
              SizedBox(height: 1.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTextButton(
                  text: "Forgot password?",
                  onPressed: () {
                    // context.push(AppRoutes.forgotPasswordScreen);
                  },
                ),
              ),
              SizedBox(height: 2.h),

              CustomeButton(
                borderSide: BorderSide.none,
                text: "Sign in",
                withIcon: false,
                onPressed: () {
                  context.push(AppRoutes.loginScreen);
                },
                buttonColor: AppColors.primary500,
                textColor: AppColors.white,
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.grey400,
                    ),
                  ),
                  CustomTextButton(
                    text: "Sign up",
                    onPressed: () {
                      context.push(AppRoutes.signUpScreen);
                    },
                  ),
                ],
              ),

              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(color: AppColors.grey400)),
                  Text(
                    "  OR  ",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.grey500,
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.grey400)),
                ],
              ),

              SizedBox(height: 4.h),

              CustomeButton(
                withIcon: true,
                icon: SvgPicture.asset(
                  "assets/Icon/Google - Original.svg",
                  height: 24,
                  width: 24,
                ),
                text: "Sign in with Google",
                onPressed: () {},
                buttonColor: AppColors.white,
                textColor: AppColors.grey900,
                borderSide: const BorderSide(color: AppColors.grey200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
