import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget buildPageIndicator({required int currentPage, required int itemCount}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(itemCount, (index) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.symmetric(horizontal: 1.w),
        width: currentPage == index ? 3.w : 2.w,
        height: currentPage == index ? 3.w : 2.w,
        decoration: BoxDecoration(
          color: currentPage == index
              ? AppColors.primary700
              : AppColors.primary200,
          shape: BoxShape.circle,
        ),
      );
    }),
  );
}
