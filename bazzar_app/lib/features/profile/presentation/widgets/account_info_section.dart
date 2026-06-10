import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:bazzar_app/features/profile/presentation/widgets/account_text_field.dart';
import 'package:flutter/material.dart';

class AccountInfoSection extends StatelessWidget {
  const AccountInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          AccountTextField(
            label: "Name",
            controller: TextEditingController(text: "John Doe"),
          ),
          AppSpacing.h15,
          AccountTextField(
            label: "Email",
            controller: TextEditingController(text: "johndoe@example.com"),
          ),
          AppSpacing.h15,
          AccountTextField(
            prefixIcon: AppAssets.phoneIcon,
            label: "Phone Number",
            controller: TextEditingController(text: "+1234567890"),
          ),
          AppSpacing.h15,
          AccountTextField(
            suffixIcon: AppAssets.passwordOutline,
            label: "Password",
            controller: TextEditingController(text: "••••••••"),
          ),
          AppSpacing.h40,
          CustomeButton(
            text: "Save Changes",
            onPressed: () {},
            buttonColor: AppColors.primary500,
            textColor: Colors.white,
            borderSide: BorderSide.none,
          ),
        ],
      ),
    );
  }
}
