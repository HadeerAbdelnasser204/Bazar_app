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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  static final _emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,}$');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignIn() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      context.push(AppRoutes.homeScreen);
    }
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
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6.h),
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
                SizedBox(height: 4.h),
                CustomTextField(
                  label: "Email",
                  hintText: "Enter your email",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    final email = value?.trim() ?? '';
                    if (email.isEmpty) return 'Please enter your email';
                    if (!_emailRegex.hasMatch(email)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  label: "Password",
                  hintText: "Enter your password",
                  controller: _passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 1.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextButton(
                    text: "Forgot password?",
                    onPressed: () {
                      context.push(AppRoutes.forgetPasswordScreen);
                    },
                  ),
                ),
                SizedBox(height: 2.h),
                CustomeButton(
                  borderSide: BorderSide.none,
                  text: "Sign in",
                  withIcon: false,
                  onPressed: _onSignIn,
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
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
