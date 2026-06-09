import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/order_card.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/thanks_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key, required this.orderNumber});

  final String orderNumber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 28,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ThanksCard(orderNumber: orderNumber),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Order Details',
                      style: AppTextStyles.h5.copyWith(
                        color: AppColors.grey900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const OrderCard(),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: CustomeButton(
              text: 'Order Status',
              onPressed: () => context.push(AppRoutes.orderReceivedRating),
              buttonColor: AppColors.primary100,
              textColor: AppColors.primary500,
              borderSide: BorderSide.none,
            ),
          ),
        ],
      ),
    );
  }
}
