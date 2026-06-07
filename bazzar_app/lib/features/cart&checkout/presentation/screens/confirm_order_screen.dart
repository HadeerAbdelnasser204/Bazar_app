import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/build_address_card.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/build_payment_card.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/build_summary_card.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/date_time_card.dart';
import 'package:flutter/material.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({super.key});

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),

              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Confirm Order',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const BuildAddressCard(),
                      const SizedBox(height: 16),

                      const BuildSummaryCard(),
                      const SizedBox(height: 16),

                      const BuildDateTimeCard(),
                      const SizedBox(height: 16),

                      BuildPaymentCard(
                        selectedPaymentMethod: selectedPaymentMethod,

                        onPaymentSelected: (payment) {
                          setState(() {
                            selectedPaymentMethod = payment;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              CustomeButton(
                text: "Order",
                onPressed: () {},
                buttonColor: AppColors.primary500,
                textColor: AppColors.white,
                borderSide: BorderSide.none,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
