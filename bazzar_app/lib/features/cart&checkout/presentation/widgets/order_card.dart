import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/order_item_row.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/summary_row.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.grey200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const OrderItemRow(
              quantity: '1x',
              name: 'Carrie Fisher',
              price: '\$19.99',
            ),
            const SizedBox(height: 12),
            const OrderItemRow(
              quantity: '1x',
              name: 'Winthrop Chaney',
              price: '\$5.99',
            ),
            const SizedBox(height: 12),
            const OrderItemRow(
              quantity: '1x',
              name: '11.22.63',
              price: '\$12.95',
            ),
            const Divider(height: 32, color: AppColors.grey200),
            const SummaryRow(title: 'Subtotal', value: '\$87.10'),
            const SizedBox(height: 12),
            const SummaryRow(title: 'Shipping', value: '\$2'),
            const Divider(height: 32, color: AppColors.grey200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Payment',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$89.10',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primary500,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Divider(height: 32, color: AppColors.grey200),
            const SummaryRow(title: 'Delivery in', value: '10 - 15 mins'),
            const SizedBox(height: 12),
            const SummaryRow(title: 'Time', value: '15.24 - 15.39'),
          ],
        ),
      ),
    );
  }
}
