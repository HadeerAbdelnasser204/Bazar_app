import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ThanksCard extends StatelessWidget {
  const ThanksCard({super.key, required this.orderNumber});

  final String orderNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Thank you 👋',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey600),
        ),
        const SizedBox(height: 8),
        Text(
          'Lorem ipsum dolor sit',
          textAlign: TextAlign.center,
          style: AppTextStyles.h3.copyWith(color: AppColors.primary500),
        ),
        const SizedBox(height: 8),
        Text(
          'Order $orderNumber',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey500),
        ),
      ],
    );
  }
}
