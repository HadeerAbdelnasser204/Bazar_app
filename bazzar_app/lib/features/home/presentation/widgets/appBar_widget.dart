import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.title, this.iconPath});

  final String title;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Spacer(),

          Text(
            title,

            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const Spacer(),

          if (iconPath != null)
            IconButton(
              onPressed: () {},

              icon: SvgPicture.asset(iconPath!, width: 24, height: 24),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
