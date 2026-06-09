import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class OrderItemRow extends StatelessWidget {
  const OrderItemRow({
    super.key,
    required this.quantity,
    required this.name,
    required this.price,
  });

  final String quantity;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 28,
          child: Text(
            quantity,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.grey900,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            name,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey900),
          ),
        ),
        Text(
          price,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.grey900,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
