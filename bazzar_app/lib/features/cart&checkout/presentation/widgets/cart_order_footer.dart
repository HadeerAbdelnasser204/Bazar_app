import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CartOrderFooter extends StatelessWidget {
  const CartOrderFooter({
    super.key,
    required this.total,
    required this.onOrderNow,
  });

  final double total;
  final VoidCallback onOrderNow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.grey200)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey700,
                  ),
                ),
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              onPressed: onOrderNow,
              backgroundColor: AppColors.primary500,
              title: 'Order Now',
              titleColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
