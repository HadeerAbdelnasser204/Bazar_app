// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_image_widget.dart';
import 'package:bazzar_app/features/order/data/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderHistorySection extends StatelessWidget {
  const OrderHistorySection({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookImageWidget(
          imageName: order.book.image,
          width: 80,
          height: 80,
          radius: 20,
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.book.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                AppSpacing.h5,

                Row(
                  children: [
                    Text(
                      order.status,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: getStatusColor(order.status),
                      ),
                    ),

                    Text(
                      ' . ${order.orderQuantity} items',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Color getStatusColor(String status) {
  switch (status) {
    case "Delivered":
      return Colors.green;

    case "Cancelled":
      return Colors.red;

    case "Pending":
      return Colors.orange;

    case "Shipped":
      return Colors.blue;

    default:
      return AppColors.grey600;
  }
}
