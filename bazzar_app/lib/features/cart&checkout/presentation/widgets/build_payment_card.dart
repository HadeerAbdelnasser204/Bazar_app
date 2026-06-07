import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/screens/payment_method_sheet.dart';
import 'package:flutter/material.dart';

class BuildPaymentCard extends StatelessWidget {
  const BuildPaymentCard({
    super.key,
    required this.selectedPaymentMethod,
    required this.onPaymentSelected,
  });

  final String? selectedPaymentMethod;
  final ValueChanged<String> onPaymentSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.credit_card)),

        title: Text(
          'Payment',
          style: AppTextStyles.bodyLarge.copyWith(color: AppColors.grey900),
        ),

        subtitle: Text(
          selectedPaymentMethod ?? 'Choose your payment',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey600),
        ),

        trailing: const Icon(Icons.chevron_right),

        onTap: () async {
          final payment = await showModalBottomSheet<String>(
            context: context,
            builder: (_) => const PaymentMethodSheet(),
          );

          if (payment != null) {
            onPaymentSelected(payment);
          }
        },
      ),
    );
  }
}
