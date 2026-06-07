import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/screens/payment_details_sheet.dart';
import 'package:flutter/material.dart';

class BuildSummaryCard extends StatelessWidget {
  const BuildSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Summary',
                style: AppTextStyles.h5.copyWith(color: AppColors.grey900),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey900,
                  ),
                ),
                Text(
                  '\$87.10',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey900,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey900,
                  ),
                ),
                Text(
                  '\$2',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey900,
                  ),
                ),
              ],
            ),

            const Divider(height: 30),

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
                    color: AppColors.grey900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),
                    builder: (_) => const PaymentDetailsSheet(),
                  );
                },
                child: Text(
                  'See details',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primary500,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
