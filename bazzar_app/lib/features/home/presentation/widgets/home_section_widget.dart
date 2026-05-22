// ignore_for_file: must_be_immutable

import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSectionWidget extends StatelessWidget {
  HomeSectionWidget({
    super.key,
    required this.image,
    this.description,
    this.value,
    this.role,
    this.isCircle = false,
    this.isVendor = false,
    this.size = 13,
  });

  final String image;
  final String? description;
  final double? value;
  final String? role;
  final bool isVendor;
  final bool isCircle;
  double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isCircle)
            CircleAvatar(radius: 55, backgroundImage: AssetImage(image))
          else if (isVendor)
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 238, 237, 237),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image(
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
                  image: AssetImage(image),
                ),
              ),
            ),

          if (description != null) ...[
            const SizedBox(height: 5),
            Text(
              description!,
              style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],

          if (value != null || role != null) ...[
            const SizedBox(height: 5),
            Text(
              value != null ? '\$${value!.toStringAsFixed(2)}' : role ?? '',
              style: TextStyle(
                fontSize: 12,
                color: value != null ? AppColors.primary500 : AppColors.grey400,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
