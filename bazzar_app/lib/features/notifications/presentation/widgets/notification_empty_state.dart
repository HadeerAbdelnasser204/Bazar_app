import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationEmptyState extends StatelessWidget {
  const NotificationEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.bellOutlineIcon,
            width: 80,
            height: 80,
            colorFilter: const ColorFilter.mode(
              AppColors.grey300,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'There is no notifications',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey900,
            ),
          ),
        ],
      ),
    );
  }
}
