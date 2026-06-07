import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 88,
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
