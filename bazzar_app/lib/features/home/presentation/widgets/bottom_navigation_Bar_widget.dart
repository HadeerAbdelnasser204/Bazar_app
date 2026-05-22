import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.grey100,
      currentIndex: currentIndex,

      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },

      type: BottomNavigationBarType.fixed,

      selectedItemColor: AppColors.primary500,
      unselectedItemColor: AppColors.grey500,

      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),

      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),

      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.homeIcon,

            colorFilter: ColorFilter.mode(
              currentIndex == 0 ? AppColors.primary500 : AppColors.grey500,
              BlendMode.srcIn,
            ),
          ),
          label: "Home",
        ),

        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.menuIcon,

            colorFilter: ColorFilter.mode(
              currentIndex == 1 ? AppColors.primary500 : AppColors.grey500,
              BlendMode.srcIn,
            ),
          ),
          label: "Category",
        ),

        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.cartIcon,
            colorFilter: ColorFilter.mode(
              currentIndex == 2 ? AppColors.primary500 : AppColors.grey500,
              BlendMode.srcIn,
            ),
          ),
          label: "Cart",
        ),

        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.profileIcon,

            colorFilter: ColorFilter.mode(
              currentIndex == 3 ? AppColors.primary500 : AppColors.grey500,
              BlendMode.srcIn,
            ),
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
