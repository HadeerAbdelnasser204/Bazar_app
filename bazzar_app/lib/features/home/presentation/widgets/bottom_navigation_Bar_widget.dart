import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.grey100,
      currentIndex: widget.currentIndex,
      onTap: (index) {
        if (index == 0) {
          context.go(AppRoutes.homeScreen);
        } else if (index == 1) {
          context.go(AppRoutes.categoryScreen);
        } else if (index == 2) {
          context.go(AppRoutes.cartScreen);
        } else if (index == 3) {
          context.go(AppRoutes.profileScreen);
        }
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
              widget.currentIndex == 0
                  ? AppColors.primary500
                  : AppColors.grey500,
              BlendMode.srcIn,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.menuIcon,
            colorFilter: ColorFilter.mode(
              widget.currentIndex == 1
                  ? AppColors.primary500
                  : AppColors.grey500,
              BlendMode.srcIn,
            ),
          ),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.cartIcon,
            colorFilter: ColorFilter.mode(
              widget.currentIndex == 2
                  ? AppColors.primary500
                  : AppColors.grey500,
              BlendMode.srcIn,
            ),
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.profileIcon,
            colorFilter: ColorFilter.mode(
              widget.currentIndex == 3
                  ? AppColors.primary500
                  : AppColors.grey500,
              BlendMode.srcIn,
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
