import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.iconPath,
    this.leadingIconPath,
  });

  final String? leadingIconPath;
  final String title;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,

      leading: leadingIconPath != null
          ? IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(leadingIconPath!, width: 24, height: 24),
            )
          : null,

      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),

      actions: [
        if (iconPath != null)
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(iconPath!, width: 24, height: 24),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
