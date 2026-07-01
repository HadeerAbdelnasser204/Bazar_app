import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BookImageWidget extends StatelessWidget {
  const BookImageWidget({
    super.key,
    this.imageColor = AppColors.grey200,
    required this.imageName,
    this.height = 155,
    this.width = 130,
    this.radius = 15,
  });

  final String imageName;
  final Color? imageColor;
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 15),
      child: Image.network(
        imageName,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[300],
            child: const Icon(Icons.broken_image),
          );
        },
        height: height,
        width: width,
      ),
    );
  }
}
