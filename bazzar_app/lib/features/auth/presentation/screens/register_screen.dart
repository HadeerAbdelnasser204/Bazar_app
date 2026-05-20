import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/verify_flow.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  static final _emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,}$');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUp() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      final email = Uri.encodeComponent(_emailController.text.trim());
      final flow = VerifyFlow.signup.queryValue;
      context.push('${AppRoutes.verifyScreen}?email=$email&flow=$flow');
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
                Text("Sign Up", style: AppTextStyles.h3),
                SizedBox(height: 1.h),
                Text(
                  "Create account and choose favorite menu",
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey500,
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  label: "Name",
                  hintText: "Enter your name",
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    final name = value?.trim() ?? '';
                    if (name.isEmpty) return 'Please enter your name';
                    if (name.length < 2) {
                      return 'Name must be at least 2 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
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
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 4.h),
                CustomeButton(
                  borderSide: BorderSide.none,
                  text: "Sign Up",
                  withIcon: false,
                  onPressed: _onSignUp,
                  buttonColor: AppColors.primary500,
                  textColor: AppColors.white,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an account? ",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.grey400,
                      ),
                    ),
                    CustomTextButton(
                      text: "Sign in",
                      onPressed: () {
                        context.push(AppRoutes.loginScreen);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "By clicking Register, you agree to our ",
                        style: TextStyle(color: AppColors.grey500),
                      ),
                      TextSpan(
                        text: "Terms",
                        style: TextStyle(
                          color: AppColors.primary500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: " and ",
                        style: AppTextStyles.bodyMedium,
                      ),
                      TextSpan(
                        text: "Data Policy",
                        style: TextStyle(
                          color: AppColors.primary500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: "."),
                    ],
                  ),
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
