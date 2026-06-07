import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/bottom_navigation_Bar_widget.dart';
import 'package:bazzar_app/features/profile/presentation/widgets/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(title: "Profile"),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 8),
        child: Column(
          children: [
            Divider(thickness: 1, color: AppColors.grey200),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: Image.asset(AppAssets.logo).image,
              ),
              title: Text(
                "John Doe",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "(+123) 456-7890",
                style: TextStyle(fontSize: 15, color: AppColors.grey500),
              ),
              trailing: TextButton(
                onPressed: () {
                  // Handle edit profile action
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Divider(thickness: 1, color: AppColors.grey200),
            ProfileSection(
              sectionTitle: "My Account",
              leadingIcon: Icons.person,
              onPressed: () {
                context.push(AppRoutes.account);
              },
            ),
            AppSpacing.h15,

            ProfileSection(
              sectionTitle: "Addresses",
              leadingIcon: Icons.location_on,
            ),
            AppSpacing.h15,

            ProfileSection(
              sectionTitle: "Your Favorites",
              leadingIcon: Icons.favorite,
              onPressed: () {
                context.push(AppRoutes.favorites);
              },
            ),
            AppSpacing.h15,

            ProfileSection(
              sectionTitle: "Order History",
              leadingIcon: Icons.list_alt_rounded,
              onPressed: () {
                context.push(AppRoutes.orderHistory);
              },
            ),
            AppSpacing.h15,

            ProfileSection(
              sectionTitle: "Help Center",
              leadingIcon: Icons.message,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 3),
    );
  }
}
