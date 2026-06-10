import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ShowModelLine extends StatelessWidget {
  const ShowModelLine({
    super.key,
    this.width = 60,
    this.height = 5,
    this.color = AppColors.grey300,
  });
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
