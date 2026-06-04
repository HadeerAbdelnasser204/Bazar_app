import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class AccountImageSection extends StatelessWidget {
  const AccountImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 90,
                width: double.infinity,
                color: AppColors.grey100,
              ),
              Positioned(
                bottom: -55,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(AppAssets.logo),
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          Text(
            "Change Picture",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.primary500,
            ),
          ),
        ],
      ),
    );
  }
}
