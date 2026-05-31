// ignore_for_file: must_be_immutable

import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  QuantitySelector({
    super.key,
    required this.minusButtonColor,
    required this.plusButtonColor,
  });
  final Color minusButtonColor;
  final Color plusButtonColor;
  int quantity = 1;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.minusButtonColor,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                if (widget.quantity > 1) {
                  widget.quantity--;
                }
              });
            },
            icon: const Icon(Icons.remove, size: 20),
          ),
        ),

        const SizedBox(width: 10),
        Text(
          widget.quantity.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.plusButtonColor,
          ),

          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                widget.quantity++;
              });
            },
            icon: const Icon(Icons.add, color: AppColors.white, size: 20),
          ),
        ),
      ],
    );
  }
}
