import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.sectionTitle,
    this.leadingIcon,
    this.leadingIconSize = 25,
    this.trailingIcon = Icons.arrow_forward_ios,
    this.trailingIconSize = 20,
    this.onPressed,
  });
  final String sectionTitle;
  final IconData? leadingIcon;
  final double leadingIconSize;
  final IconData? trailingIcon;
  final double trailingIconSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.grey100,
        radius: 20,
        child: Icon(
          leadingIcon,
          color: AppColors.primary500,
          size: leadingIconSize,
        ),
      ),
      title: Text(
        sectionTitle,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          trailingIcon,
          size: trailingIconSize,
          color: AppColors.grey500,
        ),
      ),
    );
  }
}
