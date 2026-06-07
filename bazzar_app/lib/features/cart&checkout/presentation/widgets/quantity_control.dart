import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/quantity_button.dart';
import 'package:flutter/material.dart';

class CartQuantityControls extends StatelessWidget {
  const CartQuantityControls({
    super.key,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
  });

  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuantityButton(
          icon: Icons.remove,
          color: AppColors.grey200,
          iconColor: AppColors.grey900,
          onPressed: onDecrement,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            quantity.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.grey900,
            ),
          ),
        ),
        QuantityButton(
          icon: Icons.add,
          color: AppColors.primary500,
          iconColor: AppColors.white,
          onPressed: onIncrement,
        ),
      ],
    );
  }
}
