import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/order_body.dart';
import 'package:flutter/material.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  static const String orderNumber = '#2930541';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: OrderBody(orderNumber: orderNumber),
    );
  }
}
