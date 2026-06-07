import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/price_row.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/summary_row.dart';
import 'package:flutter/material.dart';

class PaymentDetailsSheet extends StatelessWidget {
  const PaymentDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Payment Details',
            style: AppTextStyles.h5.copyWith(color: AppColors.grey900),
          ),

          const SizedBox(height: 20),
          const SummaryRow(title: 'Price', value: '\$87.10'),
          const SizedBox(height: 15),

          const PriceRow(title: 'Squid Sweet and Sour Salad', price: '\$19.99'),
          const SizedBox(height: 10),

          const PriceRow(title: 'Japan Hainanese Sashimi', price: '\$39.99'),
          const SizedBox(height: 10),

          const PriceRow(title: 'Black Pepper Beef Lumpia', price: '\$27.12'),

          const Divider(height: 32, color: AppColors.grey200),

          const SummaryRow(title: 'Shipping', value: '\$2'),
          const Divider(height: 32, color: AppColors.grey200),

          const SummaryRow(title: 'Total Payment', value: '\$89.10'),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
