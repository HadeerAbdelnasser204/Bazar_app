import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class BuildButtons extends StatelessWidget {
  const BuildButtons({
    super.key,
    required PageController pageController,
    required int currentPage,
    required List onboardingPages,
  }) : _pageController = pageController,
       _currentPage = currentPage,
       _onboardingPages = onboardingPages;

  final PageController _pageController;
  final int _currentPage;
  final List _onboardingPages;

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == _onboardingPages.length - 1;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (isLastPage) {
                Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary700,
              minimumSize: Size(double.infinity, 5.5.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              isLastPage ? "Get Started" : "Next",
              style: AppTextStyles.buttonMedium.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),

        if (isLastPage) ...[
          SizedBox(height: 1.5.h),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                context.go(AppRoutes.loginScreen);
              },
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 5.5.h),
                side: BorderSide(color: AppColors.primary700, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Sign in",
                style: AppTextStyles.buttonMedium.copyWith(
                  color: AppColors.primary700,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
