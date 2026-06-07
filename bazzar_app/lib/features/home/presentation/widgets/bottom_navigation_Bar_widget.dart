import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    this.selectedIndex = 0,
    this.cartItemCount = 0,
  });

  final int selectedIndex;
  final int cartItemCount;

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.homeScreen);
      case 2:
        context.go(AppRoutes.cartScreen);
      default:
        break;
    }
  }

  String _cartLabel() {
    if (cartItemCount > 0) {
      return 'Cart ($cartItemCount)';
    }
    return 'Cart';
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.grey100,
      currentIndex: selectedIndex,
      onTap: (index) => _onTap(context, index),
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
              selectedIndex == 0 ? AppColors.primary500 : AppColors.grey500,
              BlendMode.srcIn,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.menuIcon,
            colorFilter: ColorFilter.mode(
              selectedIndex == 1 ? AppColors.primary500 : AppColors.grey500,
              BlendMode.srcIn,
            ),
          ),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.cartIcon,
            colorFilter: ColorFilter.mode(
              selectedIndex == 2 ? AppColors.primary500 : AppColors.grey500,
              BlendMode.srcIn,
            ),
          ),
          label: _cartLabel(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.profileIcon,
            colorFilter: ColorFilter.mode(
              selectedIndex == 3 ? AppColors.primary500 : AppColors.grey500,
              BlendMode.srcIn,
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
