import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/order/data/models/order_model.dart';
import 'package:bazzar_app/features/order/presentation/widgets/order_history_section.dart';
import 'package:flutter/material.dart';

class OrderHistoryBody extends StatelessWidget {
  const OrderHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: ListView(
        children: [
          Text(
            "October 2021",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          AppSpacing.h15,
          Card(
            color: Colors.white,
            child: Column(
              children: List.generate(dummyOrders.length, (index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: OrderHistorySection(order: dummyOrders[index]),
                    ),

                    if (index != dummyOrders.length - 1)
                      Divider(thickness: 1, color: AppColors.grey300),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
