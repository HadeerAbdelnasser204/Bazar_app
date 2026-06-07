import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.grey900,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.grey900,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
