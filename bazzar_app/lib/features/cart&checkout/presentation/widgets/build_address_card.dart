import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuildAddressCard extends StatelessWidget {
  const BuildAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      borderOnForeground: true,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Address',
                style: AppTextStyles.h5.copyWith(color: AppColors.grey900),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const CircleAvatar(
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
                          color: AppColors.grey900,
                        ),
                      ),
                      Text(
                        'Dumbo Street No.20, Dumbo',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.grey500,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.push(AppRoutes.locationScreen);
                  },
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                context.push(AppRoutes.locationScreen);
              },
              child: Text(
                textAlign: TextAlign.start,
                'Change',
                style: AppTextStyles.buttonMedium.copyWith(
                  color: AppColors.primary500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
