import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PageDescriptionWidget extends StatelessWidget {
  const PageDescriptionWidget({
    super.key,
    required this.description,
    required this.subtitle,
  });
  final String description;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.grey400,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary500,
            ),
          ),
        ],
      ),
    );
  }
}
