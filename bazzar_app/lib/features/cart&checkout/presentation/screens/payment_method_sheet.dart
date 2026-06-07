import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodSheet extends StatefulWidget {
  const PaymentMethodSheet({super.key});

  @override
  State<PaymentMethodSheet> createState() => _PaymentMethodSheetState();
}

class _PaymentMethodSheetState extends State<PaymentMethodSheet> {
  int selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Your Payments', style: AppTextStyles.h5),

          const SizedBox(height: 20),

          PaymentMethodItem(
            title: 'KNET',
            image: 'assets/images/Group (3).png',
            isSelected: selectedPayment == 0,
            onTap: () {
              setState(() {
                selectedPayment = 0;
              });

              Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.pop(context, 'KNET');
              });
            },
          ),

          const SizedBox(height: 12),

          PaymentMethodItem(
            title: 'Credit Card',
            image: 'assets/images/Group (1).png',
            isSelected: selectedPayment == 1,
            onTap: () {
              setState(() {
                selectedPayment = 1;
              });

              Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.pop(context, 'Credit Card');
              });
            },
          ),
        ],
      ),
    );
  }
}
