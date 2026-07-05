import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/show_model_line.dart';
import 'package:bazzar_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bazzar_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pop(context);

          context.go(AppRoutes.loginScreen);
        }

        if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: ShowModelLine()),
              AppSpacing.h10,
              const Text(
                "Logout",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              AppSpacing.h10,
              const Text(
                "Are you sure you want to log out?",
                style: TextStyle(fontSize: 18),
              ),
              AppSpacing.h20,

              CustomeButton(
                text: isLoading ? "Logging out..." : "Logout",
                radius: 20,
                onPressed: isLoading
                    ? null
                    : () {
                        context.read<AuthCubit>().logout();
                      },
                buttonColor: AppColors.primary500,
                textColor: Colors.white,
                borderSide: BorderSide.none,
              ),

              AppSpacing.h10,

              CustomeButton(
                text: "Cancel",
                radius: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonColor: AppColors.grey100,
                textColor: AppColors.primary500,
                borderSide: BorderSide.none,
              ),

              AppSpacing.h20,
              const Center(
                child: ShowModelLine(
                  width: 150,
                  color: Color.fromARGB(223, 0, 0, 0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
