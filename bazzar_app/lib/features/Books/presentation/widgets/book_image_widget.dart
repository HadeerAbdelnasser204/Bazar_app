import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BookImageWidget extends StatelessWidget {
  const BookImageWidget({
    super.key,
    this.imageColor = AppColors.grey200,
    required this.imageName,
    this.height = 280,
    this.width = 220,
    this.radius = 10,
  });

  final String imageName;
  final Color? imageColor;
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: imageColor,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius!),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(imageName, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
