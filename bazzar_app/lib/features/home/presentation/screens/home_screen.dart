import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/bottom_navigation_Bar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/homeBody.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: 'Home',
        iconPath: AppAssets.notificationIcon,
        leadingIconPath: AppAssets.searchIcon,
      ),

      body: HomeBody(),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
