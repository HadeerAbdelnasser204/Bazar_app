import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/cart&checkout/data/models/cart_item_model.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/cart_item_image.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/quantity_control.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  final CartItemModel item;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartItemImage(image: item.image),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey900,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  item.vendor,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.grey500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary500,
                  ),
                ),
                const SizedBox(height: 8),

                CartQuantityControls(
                  quantity: item.quantity,
                  onDecrement: () {
                    if (item.quantity > 1) {
                      onQuantityChanged(item.quantity - 1);
                    }
                  },
                  onIncrement: () => onQuantityChanged(item.quantity + 1),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.close, size: 20, color: AppColors.grey500),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
