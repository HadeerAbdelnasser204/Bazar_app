import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bazzar_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountImageSection extends StatelessWidget {
  const AccountImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is! ProfileLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          final profile = state.profile;
          return Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 90,
                    width: double.infinity,
                    color: AppColors.grey100,
                  ),
                  Positioned(
                    bottom: -55,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(profile.imageUrl),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              TextButton(
                onPressed: () async {
                  context.read<ProfileCubit>().changeProfileImage();
                },
                child: Text(
                  "Change Picture",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary500,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
