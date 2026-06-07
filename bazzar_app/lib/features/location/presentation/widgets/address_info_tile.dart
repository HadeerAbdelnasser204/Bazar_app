import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AddressInfoTile extends StatelessWidget {
  const AddressInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primary100,
          child: Icon(Icons.location_on, color: AppColors.primary500),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Utama Street No.20',
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.grey900,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                'Dumbo Street No.20, Dumbo, New York 10001, United States of America',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.grey600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
