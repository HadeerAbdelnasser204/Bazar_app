import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({super.key, required this.title, required this.price});

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey500),
        ),
        Text(
          price,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey500),
        ),
      ],
    );
  }
}
