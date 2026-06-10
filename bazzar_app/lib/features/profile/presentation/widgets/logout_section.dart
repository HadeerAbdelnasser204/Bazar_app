import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/show_model_line.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: ShowModelLine()),
          AppSpacing.h10,
          Text(
            "Logout",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          AppSpacing.h10,
          Text(
            "Are you sure you want to log out?",
            style: TextStyle(fontSize: 18),
          ),
          AppSpacing.h20,
          CustomeButton(
            text: "Logout",
            radius: 20,
            onPressed: () {},
            buttonColor: AppColors.primary500,
            textColor: Colors.white,
            borderSide: BorderSide.none,
          ),
          AppSpacing.h10,
          CustomeButton(
            text: "Cancel",
            radius: 20,
            onPressed: () {},
            buttonColor: AppColors.grey100,
            textColor: AppColors.primary500,
            borderSide: BorderSide.none,
          ),
          AppSpacing.h20,
          Center(
            child: ShowModelLine(
              width: 150,
              color: const Color.fromARGB(223, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
