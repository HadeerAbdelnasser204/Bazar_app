import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:bazzar_app/features/profile/data/models/profile_model.dart';
import 'package:bazzar_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bazzar_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:bazzar_app/features/profile/presentation/widgets/account_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountInfoSection extends StatefulWidget {
  const AccountInfoSection({super.key});

  @override
  State<AccountInfoSection> createState() => _AccountInfoSectionState();
}

class _AccountInfoSectionState extends State<AccountInfoSection> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded) {
          nameController.text = state.profile.name;
          emailController.text = state.profile.email;
          phoneController.text = state.profile.phone;
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.grey500),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              AccountTextField(label: "Name", controller: nameController),
              AppSpacing.h15,
              AccountTextField(label: "Email", controller: emailController),
              AppSpacing.h15,
              AccountTextField(
                prefixIcon: AppAssets.phoneIcon,
                label: "Phone Number",
                controller: phoneController,
              ),
              AppSpacing.h15,

              AppSpacing.h40,
              CustomeButton(
                text: "Save Changes",
                onPressed: () {
                  final profile = ProfileModel(
                    uid: state is ProfileLoaded ? state.profile.uid : '',
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,

                    imageUrl: state is ProfileLoaded
                        ? state.profile.imageUrl
                        : '',
                  );

                  context.read<ProfileCubit>().updateProfile(profile);
                },
                buttonColor: AppColors.primary500,
                textColor: Colors.white,
                borderSide: BorderSide.none,
              ),
            ],
          ),
        );
      },
    );
  }
}
