import 'package:bazzar_app/features/cart&checkout/data/models/cart_item_model.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/cart_empty_state.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/cart_item_widget.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/cart_order_footer.dart';
import 'package:flutter/material.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
    required this.items,
    required this.onQuantityChanged,
    required this.onRemove,
    required this.onOrderNow,
  });

  final List<CartItemModel> items;
  final void Function(int index, int quantity) onQuantityChanged;
  final void Function(int index) onRemove;
  final VoidCallback onOrderNow;

  double get _total =>
      items.fold<double>(0, (sum, item) => sum + item.lineTotal);

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const CartEmptyState();
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return CartItemWidget(
                item: item,
                onQuantityChanged: (qty) => onQuantityChanged(index, qty),
                onRemove: () => onRemove(index),
              );
            },
          ),
        ),
        CartOrderFooter(total: _total, onOrderNow: onOrderNow),
      ],
    );
  }
}
