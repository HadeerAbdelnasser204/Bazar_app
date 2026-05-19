import 'package:bazzar_app/features/intial_screens/wigets/indecator_widget.dart';
import 'package:flutter/material.dart';
import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/intial_screens/models/onboarding_model.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageModel page;
  final int currentPage;
  final List onboardingPages;
  final PageController pageController;

  const OnboardingPage({
    super.key,
    required this.page,
    required this.currentPage,
    required this.onboardingPages,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = currentPage == onboardingPages.indexOf(page);
    final isLastPage = currentPage == onboardingPages.length - 1;

    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!isLastPage)
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.loginScreen);
                    },
                    child: Text(
                      "Skip",
                      style: AppTextStyles.buttonMedium.copyWith(
                        color: AppColors.primary700,
                      ),
                    ),
                  ),
                ),

              if (!isLastPage) SizedBox(height: 3.h) else SizedBox(height: 5.h),

              Center(
                child: AnimatedScale(
                  scale: isActive ? 1 : 0.85,
                  duration: const Duration(milliseconds: 350),
                  child: Container(
                    height: 38.h,
                    width: 65.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                        image: AssetImage(page.imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 4.h),

              Text(
                page.title,
                style: AppTextStyles.h3,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 2.h),

              Text(
                page.description,
                style: AppTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 4.h),

              buildPageIndicator(
                currentPage: currentPage,
                itemCount: onboardingPages.length,
              ),

              if (isLastPage) SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
