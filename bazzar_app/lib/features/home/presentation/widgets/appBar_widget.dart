// ignore_for_file: must_be_immutable

import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
    required this.title,
    this.iconPath,
    this.leadingIconPath,
    this.iconOnPressed,
    this.leadingOnPressed,
    this.iconWidth = 24,
    this.iconHeight,
  });

  final String? leadingIconPath;
  final String title;
  final String? iconPath;
  final void Function()? leadingOnPressed;
  final void Function()? iconOnPressed;
  double? iconWidth;
  double? iconHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,

      leading: leadingIconPath != null
          ? IconButton(
              onPressed: leadingOnPressed,
              icon: SvgPicture.asset(
                leadingIconPath!,
                width: iconWidth,
                height: iconHeight,
              ),
            )
          : null,

      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),

      actions: [
        if (iconPath != null)
          IconButton(
            onPressed: iconOnPressed,
            icon: SvgPicture.asset(
              iconPath!,
              width: iconWidth,
              height: iconHeight,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
