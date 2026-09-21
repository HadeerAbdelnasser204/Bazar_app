import 'package:bazzar_app/core/Di/get_it.dart';
import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bazzar_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bazzar_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:bazzar_app/features/profile/presentation/widgets/logout_section.dart';
import 'package:bazzar_app/features/profile/presentation/widgets/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 8),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is! ProfileLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          final profile = state.profile;

          return Column(
            children: [
              Divider(thickness: 1, color: AppColors.grey200),
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade200,
                  child: ClipOval(
                    child: profile.imageUrl.isEmpty
                        ? Image.asset(
                            AppAssets.logo,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            profile.imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              print("PROFILE IMAGE ERROR: $error");

                              return Image.asset(
                                AppAssets.logo,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                  ),
                ),
                title: Text(
                  profile.name,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  profile.phone,
                  style: TextStyle(fontSize: 15, color: AppColors.grey500),
                ),
                trailing: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) => BlocProvider(
                        create: (context) => sl<AuthCubit>(),
                        child: LogoutSection(),
                      ),
                    );
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
                onPressed: () async {
                  final result = await context.push(AppRoutes.account);

                  if (result == true && context.mounted) {
                    context.read<ProfileCubit>().loadProfile();
                  }
                },
              ),
              AppSpacing.h15,

              ProfileSection(
                sectionTitle: "Addresses",
                leadingIcon: Icons.location_on,
                onPressed: () {
                  context.push(AppRoutes.locationScreen);
                },
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
          );
        },
      ),
    );
  }
}
